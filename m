Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 598427DCC8E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 31 Oct 2023 13:06:13 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qxnVR-0007gv-Dk;
	Tue, 31 Oct 2023 12:05:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <greg@kroah.com>) id 1qxnVO-0007gn-24
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 31 Oct 2023 12:05:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hbYOa22447mRttnGntWhHFRlRn2lORGwh8Zsj6YyhzU=; b=iIXDRlRKQsF8dHcASc+Rz0Jqx5
 XZwlO8Hrx2DWVgsiCaStpCGt8rMufwS1wPiDddb1VIeZ2qHBFnmxFc6jKEr5jsRE/iz6j69Mxe2GQ
 +i2X1037Bry4WCglBvFCgB9j9NHzV08mvEaANbTRZu/++vgDEA4M4nq3NQ02Mg9D/1k0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hbYOa22447mRttnGntWhHFRlRn2lORGwh8Zsj6YyhzU=; b=L34CkHVoxBJX8b0xf75WsPxQZH
 YgRKpxozVskwD4m+UqBMlNxvu9mun4+C2EDbMahDvBKbANKuo0JEcs/kN3uiw7mx8ldzeNj0fJ7ZD
 zECZLfbceUZlOYRzcLFOwTU5VdCIRRAtJcMRjtVI6T/8qO6e6ISd8VFhlM1rOkqg2Z7I=;
Received: from wout5-smtp.messagingengine.com ([64.147.123.21])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qxnVL-0004Z7-Fs for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 31 Oct 2023 12:05:56 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 0871132009DC;
 Tue, 31 Oct 2023 07:49:40 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 31 Oct 2023 07:49:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1698752980; x=1698839380; bh=hb
 YOa22447mRttnGntWhHFRlRn2lORGwh8Zsj6YyhzU=; b=Bc7w8HUmNtoW4BMGNA
 mBGv+JAlpk4rGmFdyB1CPeF6gqv+flLr9ifzvVE5TpF6A5bCdvkwFVoz7fsUfRap
 GLiMMzGFMQZkNY2bLhr42Yhqq8yfKNycgyLMXRGCsnBZnGeQ+dioaM6SOEhFXIeu
 n0l3ZPPPYUk/kLeBpqOin0XI4gIfYowGpiZedL9Gh4+Vsy9xfn39n+VUEsJkK4ap
 dZTl/DeyueURY5AkTMizkXIsTkyUrseGr4Geqi8NjVX+eY3x92LPh66wX3Oo9gM4
 WutBxL3vpMkxyqQbDaazSdCyVchQtwMIsfPcGONagXOx81RkfGEMmYJJijXGLCSE
 RsHw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1698752980; x=1698839380; bh=hbYOa22447mRt
 tnGntWhHFRlRn2lORGwh8Zsj6YyhzU=; b=n6rgdGRZz5UGs+S8nu8JqVGoxLLN1
 H048p+7Xv9D284iDOjWT8Rm/oOiBGil3xVVgskXN1wCcysluTDjKJef64UL805An
 CFCARixU3h8gb/KOcnASMFYan/5lPXgO+1G8bN11Gn/6Ua6yrEKxYs56f72gft4G
 0QCSMzUcjzEkoPttG9EXhS5HoYS7/DIIoi7sADHSZzM/AjnnQBXil215YdhjsfDM
 M60rb0dmGmcvt0WAhizowijgs4mTNV6SaNGVK+4PZR3Lyy9jkSof1XcGRnG1O5If
 JFN/0p2zaBNTnFkgKmmKRiGwMiudP9i83ona5Mj4V1I0TgJ6pOr7GUSWg==
X-ME-Sender: <xms:1OlAZaTeb4DBsPVH_eWMuAIQ_kXm4nFpY0ShtoEzvUR5B4fm1buNjw>
 <xme:1OlAZfw_z_Ac7VlZF_y6UOuSDtXqDs-ALKT-tswkeFE68K1vlGSIz6bKgsUNd9yb4
 hUBvl4x9KDUzw>
X-ME-Received: <xmr:1OlAZX3-ajeSkLa11NSFJ3lyu-MmRA4gzDXxeYwjxJMJk9_zLakpmCfDF1-sOltCZZcdkO8NSmlLZEzODc4wa4OEuKsguJAJDQqalQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedruddtvddgfeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
 ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepgeehue
 ehgfdtledutdelkeefgeejteegieekheefudeiffdvudeffeelvedttddvnecuffhomhgr
 ihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
 epmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:1OlAZWAVUv9af9118sVXX39QrrAJ585y_dKJboeUBz3_2wOYvl9EQQ>
 <xmx:1OlAZTge66UZF03920885ETTi_IJVxGw18WeENphwWXoalhUiEWuJQ>
 <xmx:1OlAZSrKyM7vR-GOGLEPXkgJbwOXeUcaEmNqdcR5lLP6EIeDuHRC5Q>
 <xmx:1OlAZYautTiWkAwTwYBf76FVPKiCzZhAxM0neXQ1dxI9rd1QlLAcyQ>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 31 Oct 2023 07:49:39 -0400 (EDT)
Date: Tue, 31 Oct 2023 12:49:38 +0100
From: Greg KH <greg@kroah.com>
To: Kazunori Kobayashi <kazunori.kobayashi@miraclelinux.com>
Message-ID: <2023103123-purchase-criteria-8b54@gregkh>
References: <20231025085432.11639-1-kazunori.kobayashi@miraclelinux.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231025085432.11639-1-kazunori.kobayashi@miraclelinux.com>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Oct 25, 2023 at 08:54:32AM +0000, Kazunori Kobayashi
 wrote: > From: Chao Yu <chao@kernel.org> > > commit
 9056d6489f5a41cfbb67f719d2c0ce61ead72d9f
 upstream. > > As report by Wenqing Liu in bugz [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [64.147.123.21 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1qxnVL-0004Z7-Fs
Subject: Re: [f2fs-dev] [PATCH 4.19] f2fs: fix to do sanity check on inode
 type during garbage collection
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
Cc: hiraku.toyooka@miraclelinux.com, Jaegeuk Kim <jaegeuk@kernel.org>,
 stable@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Oct 25, 2023 at 08:54:32AM +0000, Kazunori Kobayashi wrote:
> From: Chao Yu <chao@kernel.org>
> 
> commit 9056d6489f5a41cfbb67f719d2c0ce61ead72d9f upstream.
> 
> As report by Wenqing Liu in bugzilla:
> 
> https://bugzilla.kernel.org/show_bug.cgi?id=215231
> 
> - Overview
> kernel NULL pointer dereference triggered  in folio_mark_dirty() when mount and operate on a crafted f2fs image
> 
> - Reproduce
> tested on kernel 5.16-rc3, 5.15.X under root
> 
> 1. mkdir mnt
> 2. mount -t f2fs tmp1.img mnt
> 3. touch tmp
> 4. cp tmp mnt
> 
> F2FS-fs (loop0): sanity_check_inode: inode (ino=49) extent info [5942, 4294180864, 4] is incorrect, run fsck to fix
> F2FS-fs (loop0): f2fs_check_nid_range: out-of-range nid=31340049, run fsck to fix.
> BUG: kernel NULL pointer dereference, address: 0000000000000000
>  folio_mark_dirty+0x33/0x50
>  move_data_page+0x2dd/0x460 [f2fs]
>  do_garbage_collect+0xc18/0x16a0 [f2fs]
>  f2fs_gc+0x1d3/0xd90 [f2fs]
>  f2fs_balance_fs+0x13a/0x570 [f2fs]
>  f2fs_create+0x285/0x840 [f2fs]
>  path_openat+0xe6d/0x1040
>  do_filp_open+0xc5/0x140
>  do_sys_openat2+0x23a/0x310
>  do_sys_open+0x57/0x80
> 
> The root cause is for special file: e.g. character, block, fifo or socket file,
> f2fs doesn't assign address space operations pointer array for mapping->a_ops field,
> so, in a fuzzed image, SSA table indicates a data block belong to special file, when
> f2fs tries to migrate that block, it causes NULL pointer access once move_data_page()
> calls a_ops->set_dirty_page().
> 
> Cc: stable@vger.kernel.org
> Reported-by: Wenqing Liu <wenqingliu0120@gmail.com>
> Signed-off-by: Chao Yu <chao@kernel.org>
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> Signed-off-by: Kazunori Kobayashi <kazunori.kobayashi@miraclelinux.com>
> ---
>  fs/f2fs/gc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c

Also applied to 5.4.y and 4.14.y, you can't forget those :)

thanks,

greg k-h


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
