Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 310D815006C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  3 Feb 2020 03:03:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iyR4n-0000sb-F6; Mon, 03 Feb 2020 02:03:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <krisman@collabora.com>) id 1iyR4m-0000sJ-P7
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 03 Feb 2020 02:03:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:In-Reply-To:
 Date:References:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nUYYIl4IRRlyjjI0vHcmCONz8SS2vgF0ouje8+gD7Tw=; b=Uo2fUt8yfSWbmbev46s764rArA
 QaAmIKxH2sE2nWcUGOIJqKjQ37u6y0MACFi9LWH/r59pN567/l8R1fWcW4KEJY8r8lWcqX0Ie6oXN
 K33ZpK8ExbAkaM1+S3/9pR+h1CZgJUD9dWtiNrmR9ZChMj6p0VRQ7u7U1HJCtTA/eH7M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nUYYIl4IRRlyjjI0vHcmCONz8SS2vgF0ouje8+gD7Tw=; b=i5Uveyo+IkZNn66RMO5RLEm/my
 ysy7sJY4WH+JTa+Sy+Lu/C9XhVSzH2Rs5uQVQK7NlrKigRayBL+WRsHKZ9csBsKgavyDQpfXSL+rI
 OqFj1xDtE0yUkupR/bvpGmyXqGo8xipp9KRfPTU8SPpAWlvTzBg1UWrThDFyyxEYderA=;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iyR4i-008gWo-KP
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 03 Feb 2020 02:03:00 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: krisman) with ESMTPSA id 085A328BEFA
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: Daniel Rosenberg <drosen@google.com>
Organization: Collabora
References: <20200128230328.183524-1-drosen@google.com>
 <20200128230328.183524-2-drosen@google.com>
Date: Sun, 02 Feb 2020 20:45:59 -0500
In-Reply-To: <20200128230328.183524-2-drosen@google.com> (Daniel Rosenberg's
 message of "Tue, 28 Jan 2020 15:03:24 -0800")
Message-ID: <85sgjsxx2g.fsf@collabora.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [46.235.227.227 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iyR4i-008gWo-KP
Subject: Re: [f2fs-dev] [PATCH v6 1/5] unicode: Add standard casefolded d_ops
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
Cc: Theodore Ts'o <tytso@mit.edu>, Jonathan Corbet <corbet@lwn.net>,
 Richard Weinberger <richard@nod.at>, Andreas Dilger <adilger.kernel@dilger.ca>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 linux-fscrypt@vger.kernel.org, linux-mtd@lists.infradead.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Daniel Rosenberg <drosen@google.com> writes:

> diff --git a/include/linux/unicode.h b/include/linux/unicode.h
> index 990aa97d80496..5de313abeaf98 100644
> --- a/include/linux/unicode.h
> +++ b/include/linux/unicode.h
> @@ -4,6 +4,8 @@
>  
>  #include <linux/init.h>
>  #include <linux/dcache.h>
> +#include <linux/fscrypt.h>
> +#include <linux/fs.h>
>  
>  struct unicode_map {
>  	const char *charset;
> @@ -30,4 +32,19 @@ int utf8_casefold(const struct unicode_map *um, const struct qstr *str,
>  struct unicode_map *utf8_load(const char *version);
>  void utf8_unload(struct unicode_map *um);
>  
> +int utf8_ci_d_hash(const struct dentry *dentry, struct qstr *str);
> +int utf8_ci_d_compare(const struct dentry *dentry, unsigned int len,
> +			  const char *str, const struct qstr *name);


I don't think fs/unicode is the right place for these very specific
filesystem functions, just because they happen to use unicode.  It is an
encoding library, it doesn't care about dentries, nor should know how to
handle them.  It exposes a simple api to manipulate and convert utf8 strings.

I saw change was after the desire to not have these functions polluting
the VFS hot path, but that has nothing to do with placing them here.

Would libfs be better?  or a casefolding library in fs/casefold.c?


-- 
Gabriel Krisman Bertazi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
