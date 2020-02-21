Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFDB168519
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Feb 2020 18:35:50 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j5CDN-0004ma-0e; Fri, 21 Feb 2020 17:35:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+b8b070cac54c30a96dd5+6025+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1j5CDL-0004mS-B2
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 Feb 2020 17:35:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Wf0h9wuAEcKNRqQhK7eYyrG9qa7B8zzOGponbVZ3cRs=; b=GcOVs5HOA3RU2sU9Ak0L9jLaPF
 F5x9s29YUAUpxTS6yjyefga5MUO75g7osVoAS9BdMS+FUeylEopHz4zpW2fLskGjdCFBhpTzXnLdo
 iPPm4el+t745Fcj0n7jg+SlAyNbuNBUgRhOHbkmU1JLqWHswblvq6mKZxP2hlN7y5SV4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Wf0h9wuAEcKNRqQhK7eYyrG9qa7B8zzOGponbVZ3cRs=; b=gnK8bopsCSWvCGM2LzhEowx6m7
 oYMIdzjmPKh3irO5LLXuwBMMRjgcfGsVyKNUbGFk0p95ZtGkqG7tF1S3RGmKv07I/C+WFuWQuPPKw
 LJqY8xj7zpSJSxxa6EiPIt3Z128QvWtvI4xaUAt6nYTJkAvi5X/TMu0HYmUWM3zEEWl8=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j5CDJ-00Cuhv-9x
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 Feb 2020 17:35:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Wf0h9wuAEcKNRqQhK7eYyrG9qa7B8zzOGponbVZ3cRs=; b=qv4T8VovROjkqztEW3g3nhCy5f
 gufHvXfCuF+Z6HXVdrnqn11v47JRrQd3KMc2Fb/NXQnDX0L8RgKN14XJA2vlmNyMfe8JNpLhmUVxc
 z25YaTqKCBiGK2Hw+2/bd4pbgopKAf4/ve6jLC7QPgm5ZDn5+iUMGtD+1h9m9riV8t/UT8f4E2FIQ
 ++ryHJSQL+q4p3uXFau3HwiSPe27IGSZ+hWHJ1wE/QCzd7pdwceRoXgVy0rGkR8NzQA6rJe3DsDAG
 fBH7BRytlaQRbZINis5xOw58oyyhiPiKjWEb9vUxnB2uZFIru9OjRckeEqfDgK73xZAiXwS1jNsGy
 osPBEkFQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j5CDD-0003J6-9C; Fri, 21 Feb 2020 17:35:39 +0000
Date: Fri, 21 Feb 2020 09:35:39 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20200221173539.GA6525@infradead.org>
References: <20200221115050.238976-1-satyat@google.com>
 <20200221115050.238976-4-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200221115050.238976-4-satyat@google.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j5CDJ-00Cuhv-9x
Subject: Re: [f2fs-dev] [PATCH v7 3/9] block: blk-crypto-fallback for Inline
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
Cc: linux-scsi@vger.kernel.org, Kim Boojin <boojin.kim@samsung.com>,
 Kuohong Wang <kuohong.wang@mediatek.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

High-level question:  Does the whole keyslot manager concept even make
sense for the fallback?  With the work-queue we have item that exectutes
at a time per cpu.  So just allocatea per-cpu crypto_skcipher for
each encryption mode and there should never be a slot limitation.  Or
do I miss something?


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
