Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5CCC29DEF
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 03 Nov 2025 03:35:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iNiyG/aKYx5hEwdibqEE8vNYbQmGFzo3caOB3nga5k8=; b=fvbvpKOkjRQWLOjFDL769WmMvq
	mw1O06BGr7R/3enrL2EvUFRlOeWIgIajt54ppHEDSjKa3yhypkT1yJ52dpPq8UQ/tqA33e+0+b6IR
	5MganlTFS1HkaMEc+MFOXnUOU7VHDko6B3PnZnUwoMhjUpIVWffGIL9Sw8iHq1uGyvSg=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vFkPu-0000EO-DP;
	Mon, 03 Nov 2025 02:35:35 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vFkPr-0000E3-W3
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Nov 2025 02:35:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NZZSTd1pUNjwCST3dPJO25f821EJPa/n3E3pgRIJPMU=; b=FLrPSj7Fi2i7X1oDgxkWQBmMEd
 xF1/3Lkg/GKIvXXmRuxKTm20ilBswxgkVHkMSCRExm4wMp5hMqw0TBe9jqsnNtWJFLfiJ6D6nS788
 lNYefGna1yKwcpA8GAoUpmO67NCfvcM97ft3BYmIfqaoHWBYixhX+iLHUjhjb6JnVKU0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NZZSTd1pUNjwCST3dPJO25f821EJPa/n3E3pgRIJPMU=; b=GtshFxfGCJtxDtgKa+seSwR3R4
 tJgOY/p/H0JAvGXbPykZsr3R5m9JEru3ug2A8OtD3UEtimcN0zQkiYRIqy9SF89rFvK4HrGbV+PL1
 33IGd8fA+UtdiLDNOGe0r4lyF8EV4A5rsASHoL2jKrILsGjXqcS2VW7xh2pLEvOaMPg0=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vFkPs-0000Vt-9R for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Nov 2025 02:35:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id F1AC8419E6;
 Mon,  3 Nov 2025 02:35:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2C65C4CEF7;
 Mon,  3 Nov 2025 02:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762137321;
 bh=Po4FITX4drt+WLGHqKt44ddsd+cJ95meWgcRiywsgWI=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=DRIHBj45SABwSm7nwmUPGcarQCoImukTtihhrTOlN0GxOb5ugziEHQIBW08lK7/3e
 pPmKR5koEcyIlpD/luPAhyXTUhG4Gxx60kS4TnNHQrNynJ2vmc8Y6qRaWZ7GK/wGSR
 Tb7BkHsCqQtwne2k4McY/9c0vYiDMXvwsh6wYwulir4II4U9TlmofcKNM4x8Dzi6Uc
 MU38ocx8yNVBXw1YAHsvHV5eF6myK0ukRKv36E9EdF1ESD2lljE6WrWz8QK8J7Ko6b
 BePDcVrp/Lvo0JP/IcpcASn3LpIPFNL0VtBu5fcdaRJSDq3jiN7W/E/bcL0XfD8m8V
 T+g/LSC4L3AxQ==
Message-ID: <ea38e464-a28a-4b06-8046-5b62f7172875@kernel.org>
Date: Mon, 3 Nov 2025 10:35:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Nikola Z. Ivanov" <zlatistiv@gmail.com>, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <cover.1761993022.git.zlatistiv@gmail.com>
 <55522ef8f3424e563ff18a720c709dcb065091af.1761993022.git.zlatistiv@gmail.com>
Content-Language: en-US
In-Reply-To: <55522ef8f3424e563ff18a720c709dcb065091af.1761993022.git.zlatistiv@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/1/25 20:56, Nikola Z. Ivanov wrote: > Add check for
 inode->i_nlink == 1 for directories during unlink,
 > as their value is decremented
 twice, which can trigger a warning in > drop_nlink. In such [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vFkPs-0000Vt-9R
Subject: Re: [f2fs-dev] [PATCH v2 2/2] f2fs: Add sanity checks before
 unlinking and loading inodes
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: david.hunter.linux@gmail.com,
 syzbot+c07d47c7bc68f47b9083@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, khalid@kernel.org, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 11/1/25 20:56, Nikola Z. Ivanov wrote:
> Add check for inode->i_nlink == 1 for directories during unlink,
> as their value is decremented twice, which can trigger a warning in
> drop_nlink. In such case mark the filesystem as corrupted and return
> from the function call with the relevant failure return value.
> 
> Additionally add the 2 checks for i_nlink == 0 and i_nlink == 1 in
> sanity_check_inode in order to detect on-disk corruption early.
> 
> Reported-by: syzbot+c07d47c7bc68f47b9083@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=c07d47c7bc68f47b9083
> Tested-by: syzbot+c07d47c7bc68f47b9083@syzkaller.appspotmail.com
> Signed-off-by: Nikola Z. Ivanov <zlatistiv@gmail.com>
> ---
>  fs/f2fs/inode.c | 10 ++++++++++
>  fs/f2fs/namei.c | 15 +++++++++++----
>  2 files changed, 21 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> index 8c4eafe9ffac..089cbf3646f0 100644
> --- a/fs/f2fs/inode.c
> +++ b/fs/f2fs/inode.c
> @@ -294,6 +294,16 @@ static bool sanity_check_inode(struct inode *inode, struct folio *node_folio)
>  		return false;
>  	}
>  
> +	if (unlikely(inode->i_nlink == 0)) {

This is a possible case, as an orphan inode may exist in filesystem after sudden
power-cut.

Thanks,

> +		f2fs_warn(F2FS_I_SB(inode), "%s: inode (ino=%lx) has zero i_nlink",
> +			  __func__, inode->i_ino);
> +		return false;
> +	} else if (S_ISDIR(inode->i_mode) && inode->i_nlink == 1) {
> +		f2fs_warn(F2FS_I_SB(inode), "%s: directory inode (ino=%lx) has a single i_nlink",
> +			  __func__, inode->i_ino);
> +		return false;
> +	}
> +
>  	if (f2fs_has_extra_attr(inode)) {
>  		if (!f2fs_sb_has_extra_attr(sbi)) {
>  			f2fs_warn(sbi, "%s: inode (ino=%lx) is with extra_attr, but extra_attr feature is off",
> diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
> index 40cf80fd9d9a..d13077bad482 100644
> --- a/fs/f2fs/namei.c
> +++ b/fs/f2fs/namei.c
> @@ -572,10 +572,11 @@ static int f2fs_unlink(struct inode *dir, struct dentry *dentry)
>  	if (unlikely(inode->i_nlink == 0)) {
>  		f2fs_warn(F2FS_I_SB(inode), "%s: inode (ino=%lx) has zero i_nlink",
>  			  __func__, inode->i_ino);
> -		err = -EFSCORRUPTED;
> -		set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
> -		f2fs_folio_put(folio, false);
> -		goto out;
> +		goto corrupted;
> +	} else if (S_ISDIR(inode->i_mode) && inode->i_nlink == 1) {
> +		f2fs_warn(F2FS_I_SB(inode), "%s: directory inode (ino=%lx) has a single i_nlink",
> +			  __func__, inode->i_ino);
> +		goto corrupted;
>  	}
>  
>  	f2fs_balance_fs(sbi, true);
> @@ -601,6 +602,12 @@ static int f2fs_unlink(struct inode *dir, struct dentry *dentry)
>  
>  	if (IS_DIRSYNC(dir))
>  		f2fs_sync_fs(sbi->sb, 1);
> +
> +	goto out;
> +corrupted:
> +	err = -EFSCORRUPTED;
> +	set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
> +	f2fs_folio_put(folio, false);
>  out:
>  	trace_f2fs_unlink_exit(inode, err);
>  	return err;



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
