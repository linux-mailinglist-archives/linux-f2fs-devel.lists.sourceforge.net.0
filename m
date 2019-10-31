Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E1BEB8E3
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 31 Oct 2019 22:22:51 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iQHu6-0003Q1-4a; Thu, 31 Oct 2019 21:22:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+4fa4615b85c97fbb822c+5912+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1iQHu2-0003PZ-Qs
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 31 Oct 2019 21:22:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Vp+FXiDesIme9wZKEonBbY9EF/rmcc94oNJSVeB9Mnc=; b=crYvo3T6LMXzd6cJPPVPLWF4mR
 K/bIGkLUdONdOojGKczNKpmbsDwGo2Rx9A9WybuXE/jUpz4PqHfTve7sh4zp7BUxBU13rWIUyeclG
 sDtFfI54rsYTPhKP9WWv2k81g+7/plES3RiaViKc4VwMzCu5HulIOt9y8oa65FGo9/Nc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Vp+FXiDesIme9wZKEonBbY9EF/rmcc94oNJSVeB9Mnc=; b=aLQBirmro/gRPH2bj5FP+NUVGr
 vS+KRHmgYePZnzBzMRvNac/nPksBo9PVn2wp7ThtdSaTySb3X9sQ4pVSLs4rEq2AjvzEZlibw+Z2B
 oQHv8PcB+DTuih60b1rByURgHwQstpFiRI4izvSNVyziqc+01Fva/7FNSLGmau9gnpW8=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iQHu1-00D2ig-LB
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 31 Oct 2019 21:22:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Vp+FXiDesIme9wZKEonBbY9EF/rmcc94oNJSVeB9Mnc=; b=X2NyMyJFykqbqzPbcpTyDRKbd
 BQ/j4YYDfZ+K17wIdlSnJWeMlmiwSCq9IMkXKUsUWN8Djbc19Zfhk+hIp7ZaVzlxBuLOGvbM7mtvD
 tdEuc2FEBLmOuRWXJW6ZqH7y/c0RNVVyx1fdanwkc0bf32knjKWhBgJhMskumnn4+48nVaeGOTn5Z
 Dz/c9saizy3IesFxr79it6vaiPCO38unEJK2Q48dPTaXVBxYTsN1JT29cogNarc3E4PHjH+0XHVS8
 wWix7xAS4JPhoqwv52QEQeoJ7XXluWPUny9K66o/qzd3n+iMFMDrWD33Gb0XpdR2PIr58Dp8mqtSI
 X2izGODzg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1iQHtq-0008OR-Uf; Thu, 31 Oct 2019 21:22:34 +0000
Date: Thu, 31 Oct 2019 14:22:34 -0700
From: Christoph Hellwig <hch@infradead.org>
To: "Theodore Y. Ts'o" <tytso@mit.edu>
Message-ID: <20191031212234.GA32262@infradead.org>
References: <20191028072032.6911-1-satyat@google.com>
 <20191028072032.6911-4-satyat@google.com>
 <20191031175713.GA23601@infradead.org>
 <20191031205045.GG16197@mit.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191031205045.GG16197@mit.edu>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iQHu1-00D2ig-LB
Subject: Re: [f2fs-dev] [PATCH v5 3/9] block: blk-crypto for Inline
 Encryption
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
Cc: linux-block@vger.kernel.org, linux-scsi@vger.kernel.org,
 Kim Boojin <boojin.kim@samsung.com>, Kuohong Wang <kuohong.wang@mediatek.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 Satya Tangirala <satyat@google.com>, Christoph Hellwig <hch@infradead.org>,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Oct 31, 2019 at 04:50:45PM -0400, Theodore Y. Ts'o wrote:
> One of the reasons I really want this is so I (as an upstream
> maintainer of ext4 and fscrypt) can test the new code paths using
> xfstests on GCE, without needing special pre-release hardware that has
> the ICE support.
> 
> Yeah, I could probably get one of those dev boards internally at
> Google, but they're a pain in the tuckus to use, and I'd much rather
> be able to have my normal test infrastructure using gce-xfstests and
> kvm-xfstests be able to test inline-crypto.  So in terms of CI
> testing, having the blk-crypto is really going to be helpful.

Implementing the support in qemu or a special device mapper mode
seems like a much better idea for that use case over carrying the
code in the block layer and severely bloating the per-I/O data
structure.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
