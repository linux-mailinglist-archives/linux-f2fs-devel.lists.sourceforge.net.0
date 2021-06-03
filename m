Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7689039AE8F
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  4 Jun 2021 01:21:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lowep-0002lg-0h; Thu, 03 Jun 2021 23:21:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1lowen-0002lT-Io
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Jun 2021 23:21:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kg9d/cgxu5hH0KpMwRZ3/qXvhsY5ewJ/hqX98WlPOS8=; b=MNFyWkURs0l7WxXW+vwcl1QxEG
 NbXmtUoN0jZZ3YRnYGjHrG1xL+dMaeE7EUmMrvK5HbJGi8VB/IL77wO8d8/AbVL3yX9Vdf7qdcNij
 Q6M0kO38dbGT5chzHG78EXQchQUKReDGB21T6L4+wyISjp8F7m759Cc0Qi1Umw+Owadc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kg9d/cgxu5hH0KpMwRZ3/qXvhsY5ewJ/hqX98WlPOS8=; b=KdBLmazepso55B0B460iCc8Mgf
 Jrmv8vfVLrLTUBGXJF9bLyPELMB0SVNzoE7v6RSDXcfHfPbr51DCJfSGV3Eq1uojrO6gwjTHZns4L
 Iagb3Px2FjfbISq2VKazZMVNzJIBL4wgt+hSrht14F4ta74cCr7V0gN+eUmk+/zMH9a0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lowej-0006UD-0B
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Jun 2021 23:21:45 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0A6BF6140A;
 Thu,  3 Jun 2021 23:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622762492;
 bh=Gak9x0Jsv0qhm09RFUhZ1Xt3qmQIL2Xcnz1VL+vQr28=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hnm0DfXImrd2t+ksfCfL4lH+3Bf6b0GvdQogi1TgrfkZF7HYbH7FbBFZ3QdIVScqB
 kPoVBtJWEzjR9CFggZf4ciU8taNYZjseLf6viVUl+ZGxIIuPyAmhwdgqWa3HrlM2dv
 puzF5QVdwhMevqBw3EQeUTF0ubVH/zc5Xa1hMZJzGUs+UNJXbqJButL5V/ag5jooF0
 nQtclPG5xz9E4T4Z3DBiIXuJF9xz/RqNCF6cQleau46SrFB4JFUVERTjt11OhzE4h9
 6ysQXwp96mroYEYleFG758g251MtnRrKJv53y51agwjEf5HxSzH5+DpmWni15U18oq
 PJiXQGc58+GhQ==
Date: Thu, 3 Jun 2021 16:21:30 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Daniel Rosenberg <drosen@google.com>
Message-ID: <YLlj+h4RiT6FvyK6@sol.localdomain>
References: <20210603095038.314949-1-drosen@google.com>
 <20210603095038.314949-3-drosen@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210603095038.314949-3-drosen@google.com>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lowej-0006UD-0B
Subject: Re: [f2fs-dev] [PATCH v2 2/2] f2fs: Advertise encrypted casefolding
 in sysfs
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
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jun 03, 2021 at 09:50:38AM +0000, Daniel Rosenberg wrote:
> Older kernels don't support encryption with casefolding. This adds
> the sysfs entry encrypted_casefold to show support for those combined
> features. Support for this feature was originally added by
> commit 7ad08a58bf67 ("f2fs: Handle casefolding with Encryption")
> 
> Fixes: 7ad08a58bf67 ("f2fs: Handle casefolding with Encryption")
> Cc: stable@vger.kernel.org # v5.11+
> Signed-off-by: Daniel Rosenberg <drosen@google.com>
> ---
>  fs/f2fs/sysfs.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index 09e3f258eb52..6604291a3cdf 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -161,6 +161,9 @@ static ssize_t features_show(struct f2fs_attr *a,
>  	if (f2fs_sb_has_compression(sbi))
>  		len += scnprintf(buf + len, PAGE_SIZE - len, "%s%s",
>  				len ? ", " : "", "compression");
> +	if (f2fs_sb_has_casefold(sbi) && f2fs_sb_has_encrypt(sbi))
> +		len += scnprintf(buf + len, PAGE_SIZE - len, "%s%s",
> +				len ? ", " : "", "encrypted_casefold");
>  	len += scnprintf(buf + len, PAGE_SIZE - len, "%s%s",
>  				len ? ", " : "", "pin_file");
>  	len += scnprintf(buf + len, PAGE_SIZE - len, "\n");
> @@ -579,6 +582,7 @@ enum feat_id {
>  	FEAT_CASEFOLD,
>  	FEAT_COMPRESSION,
>  	FEAT_TEST_DUMMY_ENCRYPTION_V2,
> +	FEAT_ENCRYPTED_CASEFOLD,
>  };

Actually looking at it more closely, this patch is wrong.

It only makes sense to declare "encrypted_casefold" as a feature of the
filesystem implementation, i.e. /sys/fs/f2fs/features/encrypted_casefold.

It does *not* make sense to declare it as a feature of a particular filesystem
instance, i.e. /sys/fs/f2fs/$disk/features, as it is already implied by the
filesystem instance having both the encryption and casefold features enabled.

Can we add /sys/fs/f2fs/features/encrypted_casefold only?

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
