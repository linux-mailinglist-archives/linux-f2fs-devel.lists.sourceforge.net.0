Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B861D15AE
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 May 2020 15:36:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jYrZ7-0002hT-Lk; Wed, 13 May 2020 13:36:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+0881196e8d815fc0828c+6107+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1jYrZ6-0002hM-Ir
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 May 2020 13:36:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MTm+io+HMLreqyOoq/Gxy8SLIywzVQ4X+H1LtVIs47k=; b=bRvcPsFgqXJMOVDj6W5Jv479uc
 qNsoIEMN/vSMN8Qoq8ruPG0/XKBl/tobsj4u6m8oHFLkU69rpCuujQw7pRVGcAXkpHZ1UlXCcEBX3
 zeD896Lp8iAR8kAPN3Wyk+FYJIbvd93sDz64JoLl4HMN8yh1yhw4zEMHYUPbaaYRojYk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MTm+io+HMLreqyOoq/Gxy8SLIywzVQ4X+H1LtVIs47k=; b=nO/oYNTMqRMZiOsfsqgxP8Cqku
 76hd1f2xgygzmDXW+6EvYmBc+okgZw00kreSxHyACpMWDDe+fCwKSr5xv2D2Ab5p691/SBHW4+Erj
 q1eegVmH+Yqd71n7AlF4/sxihOfWlLNDIjh4dWjqfxknmVtTCA87GGQs5kSqXJbsQ6CE=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jYrZ5-004zDU-8z
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 May 2020 13:36:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=MTm+io+HMLreqyOoq/Gxy8SLIywzVQ4X+H1LtVIs47k=; b=a7hp0YNbk++yuVE5NuE9L2UOiP
 A1FNTYC41aHrRapxB9q16NeHjY9xAsejt0fo3Fov63OZJxpe1su9n7rYCljBRKvsBqC6X/aT5xguF
 NQkv+v4Njtx6fNOeML/tWnwNK3IjeGxcixOe5JD6OKrJA239YxX+Gsg6ETGHY/pE/MbNaNABB1Nc9
 CTIQL4HJlxzN/xg1A3UjCj1uZNktEiY9thBRjfEpbUih4xjN5oPycuo5NSDIQMGNdTLgkhFmfKntD
 X93nGjmYIsYF2t8tlzpjVqZ14RP3n9OIqkP7M7qVOqqorwOQPdFw5H/O3Eouk50+9DFw81k2+YLCf
 HoEpYvJQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jYrYz-0006t6-Rj; Wed, 13 May 2020 13:36:45 +0000
Date: Wed, 13 May 2020 06:36:45 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20200513133645.GB10793@infradead.org>
References: <20200430115959.238073-1-satyat@google.com>
 <20200430115959.238073-4-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200430115959.238073-4-satyat@google.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jYrZ5-004zDU-8z
Subject: Re: [f2fs-dev] [PATCH v12 03/12] block: Inline encryption support
 for blk-mq
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
Cc: linux-scsi@vger.kernel.org, Kim Boojin <boojin.kim@samsung.com>,
 Kuohong Wang <kuohong.wang@mediatek.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

although this will need a rebase to the latest block tree.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
