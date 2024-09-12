Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A8D976A2A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Sep 2024 15:13:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sojdS-0004K7-LP;
	Thu, 12 Sep 2024 13:13:22 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1sojdR-0004K0-9Q
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Sep 2024 13:13:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8ha6rW27ZIti3ibXL0Tfok2s62J7TAoIUJwlpmmHK2s=; b=mWnw+vFRAdGAGvod6EtbfvERCV
 G4ut2UR7twNdETS3ALAkQFqHnd5+z6NM2DFskD/H0T9ChFlQpzCcJyDO24QSnQUOU8KofF1Gn9mV/
 S18qxfLZifMCyA9pLfzr0pxGt9Rm6yt5DcfPSygNRekjBknOeh4GAk8/O6VMF3qB8xRE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8ha6rW27ZIti3ibXL0Tfok2s62J7TAoIUJwlpmmHK2s=; b=hSS/odKBHb70wpsyPJT1OCcu+S
 EPQwKMMBzyiBv3A6TpLu84QL1NEwPtTHY5vmTf7351+hKe6VeTNoneJBlWGjE2OjJGwzawhuVcVyG
 NYRSu/54WVrILNvxs2y63Xd6eTfbAsY4coH0HHs2KlgHb2KVhFZGM0k7DG+nVZOugQOY=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sojdP-0007jc-VW for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Sep 2024 13:13:20 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 1096E227AAF; Thu, 12 Sep 2024 14:53:48 +0200 (CEST)
Date: Thu, 12 Sep 2024 14:53:47 +0200
From: Christoph Hellwig <hch@lst.de>
To: Kanchan Joshi <joshi.k@samsung.com>
Message-ID: <20240912125347.GA28068@lst.de>
References: <20240910150200.6589-1-joshi.k@samsung.com>
 <CGME20240910151044epcas5p37f61bb85ccf8b3eb875e77c3fc260c51@epcas5p3.samsung.com>
 <20240910150200.6589-2-joshi.k@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240910150200.6589-2-joshi.k@samsung.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Sep 10, 2024 at 08:31:56PM +0530,
 Kanchan Joshi wrote:
 > Rename enum rw_hint to rw_lifetime_hint. > Change i_write_hint (in inode),
 bi_write_hint(in bio), and write_hint > (in request) to use [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1sojdP-0007jc-VW
Subject: Re: [f2fs-dev] [PATCH v5 1/5] fs, block: refactor enum rw_hint
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
Cc: axboe@kernel.dk, linux-block@vger.kernel.org, brauner@kernel.org,
 jack@suse.cz, sagi@grimberg.me, martin.petersen@oracle.com,
 gost.dev@samsung.com, jlayton@kernel.org, vishak.g@samsung.com,
 linux-nvme@lists.infradead.org, linux-f2fs-devel@lists.sourceforge.net,
 James.Bottomley@HansenPartnership.com, linux-fsdevel@vger.kernel.org,
 chuck.lever@oracle.com, javier.gonz@samsung.com, viro@zeniv.linux.org.uk,
 linux-scsi@vger.kernel.org, kbusch@kernel.org, jaegeuk@kernel.org, hch@lst.de,
 bvanassche@acm.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Sep 10, 2024 at 08:31:56PM +0530, Kanchan Joshi wrote:
> Rename enum rw_hint to rw_lifetime_hint.
> Change i_write_hint (in inode), bi_write_hint(in bio), and write_hint
> (in request) to use u8 data-type rather than this enum.
> 
> This is in preparation to introduce a new write hint type.

The rationale seems a bit sparse.  Why is it renamed?  Because the
name fits better, because you need the same for something else?

>  static void submit_bh_wbc(blk_opf_t opf, struct buffer_head *bh,
> -			  enum rw_hint hint, struct writeback_control *wbc);
> +			  u8 hint, struct writeback_control *wbc);

And moving from the enum to an plain integer seems like a bit of a
retrograde step.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
