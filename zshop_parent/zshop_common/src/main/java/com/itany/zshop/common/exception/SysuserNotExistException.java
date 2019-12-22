package com.itany.zshop.common.exception;

/**
 * Author：汤小洋
 * Date：2018-04-28 15:47
 * Description：<描述>
 */
public class SysuserNotExistException extends Exception {
    public SysuserNotExistException() {
        super();
    }

    public SysuserNotExistException(String message) {
        super(message);
    }

    public SysuserNotExistException(String message, Throwable cause) {
        super(message, cause);
    }

    public SysuserNotExistException(Throwable cause) {
        super(cause);
    }
}
