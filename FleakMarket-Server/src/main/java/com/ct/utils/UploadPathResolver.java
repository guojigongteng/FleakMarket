package com.ct.utils;

import java.io.File;

/**
 * Resolves the local upload directory to an absolute path.
 */
public final class UploadPathResolver {

    private UploadPathResolver() {
    }

    public static File resolve(String configuredPath) {
        File configured = new File(configuredPath);
        if (configured.isAbsolute()) {
            return configured;
        }

        // IntelliJ may use the repository root as the working directory.
        File serverModulePath = new File(
                System.getProperty("user.dir"),
                "FleakMarket-Server" + File.separator + configuredPath
        ).getAbsoluteFile();
        if (serverModulePath.exists()) {
            return serverModulePath;
        }

        File workingDirectoryPath = configured.getAbsoluteFile();
        if (workingDirectoryPath.exists()) {
            return workingDirectoryPath;
        }

        // Keep the normal working-directory behavior for a fresh deployment.
        return workingDirectoryPath;
    }
}
