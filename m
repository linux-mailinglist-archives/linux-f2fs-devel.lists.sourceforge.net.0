Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1DA1D8E01
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 19 May 2020 05:02:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jasWM-0000yz-De; Tue, 19 May 2020 03:02:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jasWL-0000ym-A9
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 19 May 2020 03:02:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ETGHKlPEY6SGsRxoo0eyN2ha0bk9/gEf2r5OgTD0esE=; b=lX8Lc5+27I0asDq1ZnxmKFgslJ
 dRyK0xWIUORDvx8JvzqQToA2TQQkA6LYjDR6ccKPSstFuLhTK/Ag7bo/EjpWKP0svcLXdUkBIRJ9P
 M/xIONOlckuL+LZAM1tRazRnrssg89S5KZyIvghdzFxokEb4Dc6qdOtgKaWE5GtFhBcY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ETGHKlPEY6SGsRxoo0eyN2ha0bk9/gEf2r5OgTD0esE=; b=hWkGc6xIFzHfO7GarFtkHUSTup
 H1sONsiD8FqbF1n8y3hOWKG4Sp5FdzjhWsoVNE+dqCshllJke8R65GwynaZwycgdOepalA/b/8SuI
 X4uE9dKzw0EUtdh1pwiDKLK8dRspRfCR66H2FOukWarNBHCtws+hc+a5gdisHh4IMbwc=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jasWH-006g42-QA
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 19 May 2020 03:02:21 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2FB3A20674;
 Tue, 19 May 2020 03:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589857327;
 bh=X8YHRiLKQoQ6+JmZo7Oxjcd3USBjbkqpIVem4nd309o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eb3mO0yxEi+iS5wCwgWeMw3Ys0WUFX81Iti+oojCV8xF+cl3rrYACwmiAbxSEqG1Y
 kgupo8V2TQAjIY8nv0wu7xOYCl+f0OTcog+6pq2nx1upUsb2wm3M/2e97IaxnG5Hpp
 8XUQWcrju8GGN0uTqMmi7PtuJsAqfLo0pAR2uVJw=
Date: Mon, 18 May 2020 20:02:05 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: "Theodore Y. Ts'o" <tytso@mit.edu>
Message-ID: <20200519030205.GB954@sol.localdomain>
References: <20200512233251.118314-1-ebiggers@kernel.org>
 <20200512233251.118314-4-ebiggers@kernel.org>
 <20200519025355.GC2396055@mit.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200519025355.GC2396055@mit.edu>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1jasWH-006g42-QA
Subject: Re: [f2fs-dev] [PATCH 3/4] fscrypt: support test_dummy_encryption=v2
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-fscrypt@vger.kernel.org,
 linux-ext4@vger.kernel.org, Daniel Rosenberg <drosen@google.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, May 18, 2020 at 10:53:55PM -0400, Theodore Y. Ts'o wrote:
> On Tue, May 12, 2020 at 04:32:50PM -0700, Eric Biggers wrote:
> > From: Eric Biggers <ebiggers@google.com>
> > 
> > v1 encryption policies are deprecated in favor of v2, and some new
> > features (e.g. encryption+casefolding) are only being added for v2.
> > 
> > Therefore, the "test_dummy_encryption" mount option (which is used for
> > encryption I/O testing with xfstests) needs to support v2 policies.
> > 
> > To do this, extend its syntax to be "test_dummy_encryption=v1" or
> > "test_dummy_encryption=v2".  The existing "test_dummy_encryption" (no
> > argument) also continues to be accepted, to specify the default setting
> > -- currently v1, but the next patch changes it to v2.
> > 
> > To cleanly support both v1 and v2 while also making it easy to support
> > specifying other encryption settings in the future (say, accepting
> > "$contents_mode:$filenames_mode:v2"), make ext4 and f2fs maintain a
> > pointer to the dummy fscrypt_context rather than using mount flags.
> > 
> > To avoid concurrency issues, don't allow test_dummy_encryption to be set
> > or changed during a remount.  (The former restriction is new, but
> > xfstests doesn't run into it, so no one should notice.)
> > 
> > Tested with 'gce-xfstests -c {ext4,f2fs}/encrypt -g auto'.  On ext4,
> > there are two regressions, both of which are test bugs: ext4/023 and
> > ext4/028 fail because they set an xattr and expect it to be stored
> > inline, but the increase in size of the fscrypt_context from
> > 24 to 40 bytes causes this xattr to be spilled into an external block.
> > 
> > Signed-off-by: Eric Biggers <ebiggers@google.com>
> 
> Signed-off-by: Theodore Ts'o <tytso@mit.edu>
> 
> Looks good, but could you do me a favor and merge in this?
> 
> diff --git a/fs/ext4/sysfs.c b/fs/ext4/sysfs.c
> index 04bfaf63752c..6c9fc9e21c13 100644
> --- a/fs/ext4/sysfs.c
> +++ b/fs/ext4/sysfs.c
> @@ -293,6 +293,7 @@ EXT4_ATTR_FEATURE(batched_discard);
>  EXT4_ATTR_FEATURE(meta_bg_resize);
>  #ifdef CONFIG_FS_ENCRYPTION
>  EXT4_ATTR_FEATURE(encryption);
> +EXT4_ATTR_FEATURE(test_dummy_encryption_v2);
>  #endif
>  #ifdef CONFIG_UNICODE
>  EXT4_ATTR_FEATURE(casefold);
> @@ -308,6 +309,7 @@ static struct attribute *ext4_feat_attrs[] = {
>  	ATTR_LIST(meta_bg_resize),
>  #ifdef CONFIG_FS_ENCRYPTION
>  	ATTR_LIST(encryption),
> +	ATTR_LIST(test_dummy_encryption_v2),
>  #endif
>  #ifdef CONFIG_UNICODE
>  	ATTR_LIST(casefold),
> 
> This will make it easier to have the gce-xfstests test runner know
> whether or not test_dummy_encryption=v1 / test_dummy_encryption=v2
> will work, and whether test_dummy_encryption tests v1 or v2.
> 

Thanks, I'll add that.  I assume you meant "Reviewed-by"?

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
