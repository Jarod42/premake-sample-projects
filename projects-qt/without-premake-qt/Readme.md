## without-premake-qt:

Qt project which doesn't use [premake-qt module](https://github.com/dcourtois/premake-qt)

- uic rule
- rcc filter
- manual handling of moc listing :-/ (but handle both header and source files)
- translations rule (convert .ts files into .qm files)
- manual handling of modules (for define, include path, link path)
- Manual use of environment variables ("QTDIR", "QT_DIR") to know paths.
