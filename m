Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C9BAB5B63
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 May 2025 19:33:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cjiYAxrmjyiMKzSRrHmsZwXBR/n5eS7QRePeYPpkDvY=; b=UGh0/iddIaSJop/mFfw0Hf//Gy
	oBM90xzVDHHdLUrVLlraTQALx9LufYAgrsISiZk21Ur2YyrZETmFKiYxvB9CkXfBVA6z0vltx9LCj
	KfPotbEiT2q0XciVM+E+CEdcytp+c9GOTpuZ1J9Fn8Qv3Y+kxAGQNIi8DLm7sOk5+Gtk=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uEtVe-0001QO-JZ;
	Tue, 13 May 2025 17:33:42 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1uEtVd-0001QD-LU
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 May 2025 17:33:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kLOCA3qjcFmfI2gIKx2IIVvNgw3nneqtNdkjMSPw1eY=; b=j9iu9ArOaHPzfIvwSIjRi6vXpX
 vMPdmS/V9bdgol1QxbPH2R2gQd6+GWAwHEXx9pBlbMHRrAm1933eFy5IUyZvnVjJ8JiG6O0rQa/4Z
 OzEiZw3/IQKTIet3RMLjSQpjJ5e0s3z78jgpSFZMRQ6rX3c3dFMNVkx/ppa6BsKXwkOY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kLOCA3qjcFmfI2gIKx2IIVvNgw3nneqtNdkjMSPw1eY=; b=LNnEFOdF33qqmSbwPgQN0B1fTe
 xhnuDlSLedA1ptTpgycevXNAZbFlK3vPlCV7AmEtHzlbfzW1YwijzkCZQWMd5Dfnah1hMNG7anAu2
 h9VosZw3cJqoWKYjEM+R2ftDlyHRllQj0Ccyi9SVhF87KHZJJ9qLBbTzaIeodxuzN3MI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uEtVd-0004yt-5Y for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 May 2025 17:33:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 764BE5C463F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 13 May 2025 17:31:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55FB4C4CEE4;
 Tue, 13 May 2025 17:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747157610;
 bh=8/kxUx03Cd56tPDMq34yg6hEdXcccZ6H0bfwJAdVMbw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uIpAOfcTg84I8u7cgzS++51FL1oynmVddsgOKaLO4Vs4eG/oFAFbNsKWL0m3GC4je
 cfu6UIGP8NxXOLu+/ox6yNyYX9IwH1zgMfAYfqrs6NNVd9oQvK997uHjHGAvoL03YJ
 A5pjOKrZNdhHQXew6f/1Tg/k3EnE0MKADxm0g9+zkN9l5lT2bPnWhljP7uhg6A5syW
 0SDrHWZ3+XWZUUgVsz2Uc/wZ6cV8Pxd4fTTGvYnSckSyLEMIDnHdoV6739TmuGcDVg
 1sB7S6C1r8x5Qq0sxpuJ8hDPsIA+hBcLM5sYqcQ3fIJdKlkdjGZV7GcIX4GyE8Jf0a
 1KNvw6DX8nOsw==
Date: Tue, 13 May 2025 17:33:28 +0000
To: Chao Yu <chao@kernel.org>
Message-ID: <aCOCaDyFm-etmFiF@google.com>
References: <20250513031907.2876275-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250513031907.2876275-1-chao@kernel.org>
X-Spam-Score: -6.6 (------)
X-Spam-Report: Spam detection software, running on the system "6901ab67b84d", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 05/13,
 Chao Yu wrote: > mapping_read_folio_gfp() will return
 a folio, it should always be > uptodate, let's check folio uptodate status
 to detect any potenial > bug. > > Signed-off-by: Chao Yu <cha [...] 
 Content analysis details:   (-6.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/, high
 trust [139.178.84.217 listed in list.dnswl.org]
X-Headers-End: 1uEtVd-0004yt-5Y
Subject: Re: [f2fs-dev] [PATCH v2 2/2] f2fs: add f2fs_bug_on() in
 f2fs_quota_read()
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 05/13, Chao Yu wrote:
> mapping_read_folio_gfp() will return a folio, it should always be
> uptodate, let's check folio uptodate status to detect any potenial
> bug.
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
> v2:
> - just add f2fs_bug_on(), get rid of error handling.
>  fs/f2fs/super.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 0ee783224953..8c77a625427c 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -2973,6 +2973,12 @@ static ssize_t f2fs_quota_read(struct super_block *sb, int type, char *data,
>  			goto repeat;
>  		}
>  
> +		/*
> +		 * should never happen, just leave f2fs_bug_on() here to catch
> +		 * any potential bug.
> +		 */
> +		f2fs_bug_on(sbi, !folio_test_uptodate(folio));

Applied with		    F2FS_SB(sb)

> +
>  		memcpy_from_folio(data, folio, offset, tocopy);
>  		f2fs_folio_put(folio, true);
>  
> -- 
> 2.49.0


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
