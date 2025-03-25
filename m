Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BF33BA6ED50
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Mar 2025 11:07:25 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tx1Bm-0007a3-BN;
	Tue, 25 Mar 2025 10:07:18 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tx1Bc-0007ZN-Co
 for Linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Mar 2025 10:07:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Lw2NXFir6zRA3SdDn9Cv8bQ5oCG7r5IwZrxvl07pRdY=; b=bS/ymTOlE+B/lkek+S7DLu9DdS
 xYaG+oJTczJRyMqpeqUI4aviAxk/x4IwJoeCT3pd2KujLxCNa04i598Plf0/F+aDrk9gxfiuuHoEt
 u85XHvO2o59Kc/0NvNo6bQqrDKcflGdLL0MUvG2/38SpjkeDnAKvE94j1koEcUyxfLVM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Lw2NXFir6zRA3SdDn9Cv8bQ5oCG7r5IwZrxvl07pRdY=; b=ABVt0a/csZLHPOhbmqQpTQcjy5
 g/LTHJ6/P/smNGmUyb4obYelDSQg5saKgHH5vmBghBs0DgwVJhq0XZTkcygRAp88BqM0XEiXMpR72
 N0BhiIwOAC055YTNYhvVrc4dkVcqGhHNiv/piTJUcamhWjKZXFcKqJtH0tPq9G1aHQGA=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tx1Ba-00054X-Ub for Linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Mar 2025 10:07:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Lw2NXFir6zRA3SdDn9Cv8bQ5oCG7r5IwZrxvl07pRdY=; b=EutkRCejCq9V3jSwyWviKVwiQP
 P+YzTUnymsIqR/Ntnvvd5QRam4jqXlLxglq9nJ4b1xpRiE4Gj8LsFhy9crWjejAVqCewAHJoB8xLy
 eNvnsjjmsj9mgBFmfNKfi2nrtt3sQMZjWeIb0tnbSQXXxLe8Cl4irzRcAUqpWx4ZQLXZD7uYezkv4
 tmVfQci/E9/3uiqXM+Ezmca9hbVCI+MxrqnZURsUOV5Hevg3GPUYZ8UrcbGGuQNaDcKrt2+ONWyE4
 tnP8Kpdg5BZvRm4a3+RKs20e1tFCcqGA1WpZ5P1iJiMe3y42FO2RjtMxtTaW/14ssPCGt95aNZUB+
 tekW5qiA==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1tx1BP-00000003lJc-0hSO; Tue, 25 Mar 2025 10:06:55 +0000
Date: Tue, 25 Mar 2025 10:06:55 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Nanzhe Zhao <nzzhao.sigma@gmail.com>
Message-ID: <Z-KAP6Jz_bjuPuyx@casper.infradead.org>
References: <CAMLCH1FEuoDxFFQ8HuUdBDMfzsyaS2LWyVh+eyGCpgxnKGa7rA@mail.gmail.com>
 <Z-Aai24gPXWQp8qi@casper.infradead.org>
 <CAMLCH1HsT+AVZSXAh8Q7Zr9C3SzaegfMdE6fzKp0X0FDt9JSbA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMLCH1HsT+AVZSXAh8Q7Zr9C3SzaegfMdE6fzKp0X0FDt9JSbA@mail.gmail.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Mar 24, 2025 at 08:47:05AM +0800, Nanzhe Zhao wrote:
 > Knowing that the F2FS community is currently heavily invested in the >
 folio support effort, I wanted to also bring up some observations [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in bl.score.senderscore.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [90.155.50.34 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1tx1Ba-00054X-Ub
Subject: Re: [f2fs-dev] Inquiry regarding plans on vmscan pageout supporting
 fs writepages
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
Cc: Linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Mar 24, 2025 at 08:47:05AM +0800, Nanzhe Zhao wrote:
> Knowing that the F2FS community is currently heavily invested in the
> folio support effort, I wanted to also bring up some observations and
> questions regarding folio support in F2FS garbage collection.
> Specifically, I'm concerned about the challenge of allocating
> high-order folios due to non-contiguous index ranges during the GC
> process. I've initiated a discussion about this issue on the f2fs
> mailing list in an email
> thread.[https://lore.kernel.org/linux-f2fs-devel/CAMLCH1F8niz3qifu9pt6C3yLhonadD=feaPtWKhCaRD8FPJhRg@mail.gmail.com/T/#u]
> I would be grateful if you and other developers could take a look and
> share your thoughts.

Sorry, I'm at LSFMM this week and don't have time to dig into this.
I hope you saw my recent email about folios:

https://lore.kernel.org/linux-f2fs-devel/Z9RR2ubkS9CafUdE@casper.infradead.org/

The fundamental problem is that f2fs has no per-block data structure.  In
ext4, that's struct buffer_head.  For XFS, it's struct iomap_folio_state.
For btrfs, it's struct btrfs_subpage and for bcachefs, it's struct
bch_folio.

Either f2fs needs to grow its own, or it needs to share iomap with
XFS.  Both options are a lot of work; iomap doesn't support all the
functionality that f2fs needs.  But btrfs is looking to move to using
iomap and it has some of the same needs that f2fs has, so perhaps you
can help each other.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
