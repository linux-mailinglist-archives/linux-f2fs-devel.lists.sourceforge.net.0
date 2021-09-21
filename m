Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5F9412D57
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 Sep 2021 05:18:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mSWII-0008II-EQ; Tue, 21 Sep 2021 03:18:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1mSWIH-0008I9-LZ
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 21 Sep 2021 03:18:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XKm4fMkYB5BqCFsynK6e7C2Q+raC7VJQcQNAMCdj5tw=; b=OB4GvBwupjZvc/fQtC2MURRKDS
 LZvhmwF2N/zeaiLMmAfOcOghZ9P/2xNpZBQElryJeaooe8UvP1alnaaU5J5Whucudq1HxZMi6vfJ7
 Xs/aLXca0y7ykKstLdTMDB7XU2EZBDVGQgtqCcx9Uws8MYUa5QKRRxcOiJCKXjRcxWp0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XKm4fMkYB5BqCFsynK6e7C2Q+raC7VJQcQNAMCdj5tw=; b=GbWz5zwaahA/wOI5bQICSarM4N
 zT3jJ7zGtLqlX3VgYYwAqxkvsJCVj4czR8bTQrBKBmGS5eoVj5zKKXq5rOyE/qX5iI+5ltkZJiPbA
 T1cZv+DdDDwpSIiH6kFnAXC6UO13Z47GvJYzG71SkRuMhC7HJ7yKDiFj/YftkpDBBGOs=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mSWID-00027u-DN
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 21 Sep 2021 03:18:05 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C10B560FA0;
 Tue, 21 Sep 2021 03:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632194263;
 bh=1z2WAjQcgYOvO1mOy7tZvGYG0cWDjea2L4QGJOBqXAc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jfAHRu31KG3TG0GFmYsYqIynz89ivQwawvig6FqG9mFfDKclwPC2tAqXg+XxwC510
 dKhH5VQdRP5cnl7yeHUPIgYKDkbLyXwADJ9kY7dOYreG8CkkiTStmaAY/0bNMnHkn6
 n5npjmo00AqREwTfwH9XqKpNRcuErmIxqdJxqfQ6UetUWz6wgbILr/UMu6pAAYQJrc
 zgoWhIY/wM6NKkoZbQutvcFtqjFBu9cu7WZta6glZmqJONVdv3+/Xho71IQziIbc5E
 JB+aSx88i6VDIWdXvcUlmrHgoHlbmwgyBdKWLLPocqN+hHdwBrtFY1bUpf2a2EIIAo
 2uEQgbIWVPLDg==
Date: Mon, 20 Sep 2021 20:17:42 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Message-ID: <YUlO1vmMXRaHHpTK@sol.localdomain>
References: <20210909184513.139281-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210909184513.139281-1-ebiggers@kernel.org>
X-Spam-Score: -6.7 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Sep 09, 2021 at 11:45:13AM -0700, Eric Biggers wrote:
 > From: Eric Biggers <ebiggers@google.com> > > The max_namelen field is
 unnecessary, 
 as it is set to 255 (NAME_MAX) on > all filesystems t [...] 
 Content analysis details:   (-6.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mSWID-00027u-DN
Subject: Re: [f2fs-dev] [PATCH] fscrypt: remove
 fscrypt_operations::max_namelen
X-BeenThere: linux-f2fs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-f2fs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=linux-f2fs-devel>
List-Post: <mailto:linux-f2fs-devel@lists.sourceforge.net>
List-Help: <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=subscribe>
Cc: linux-ext4@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Sep 09, 2021 at 11:45:13AM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> The max_namelen field is unnecessary, as it is set to 255 (NAME_MAX) on
> all filesystems that support fscrypt (or plan to support fscrypt).  For
> simplicity, just use NAME_MAX directly instead.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  fs/crypto/fname.c       | 3 +--
>  fs/ext4/super.c         | 1 -
>  fs/f2fs/super.c         | 1 -
>  fs/ubifs/crypto.c       | 1 -
>  include/linux/fscrypt.h | 3 ---
>  5 files changed, 1 insertion(+), 8 deletions(-)

Applied to fscrypt.git#master for 5.16.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
