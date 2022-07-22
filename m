Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F01D57DBC7
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Jul 2022 10:10:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oEnk6-0003he-04; Fri, 22 Jul 2022 08:10:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2) (envelope-from
 <BATV+ac08b8ce4c4c68a722ed+6907+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1oEnk3-0003gZ-Hl
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 22 Jul 2022 08:10:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=; b=Y0I4GO0kApAv3A+sGyXBEXkGAg
 ZCrMQv2upzJfDtJTdyYTeVp3Y4TIXfpP2IEYqWJFC/jeJlWeZFAfeLSGTUxEoItqs/ITUAPjyo+do
 +duLyt932KMLGjaIJ5UkITcHvJV9GJIJLivMPGAQpNeu1fbrI/2Uqjlt9y/TBouXW31M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=; b=JV9o+INed5rHL1bZ17NEUU4et7
 2D84ooTtn5A+jjC9m57mOdsbhA3f/X6l+/zcX9Ekgug3Lsrgkm5dGX09525+RjD+pwNlLhqhiCWa3
 TxgCM4gZqdjz6/XwFlUZYE3NVjvdw6ooeUeL4PxDQEu+E8HYyN5sXor17wTHK+2hiXBA=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oEnk1-006gse-GO
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 22 Jul 2022 08:10:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=; b=ZkEKbL97JgGq0RpvK5MBQz7Feo
 oOHmwcYNRRCCUuis4HumS5f/HlmWfKQVQMfIic9XD86iCTfsj1ytX89VlQLzFFRBR3yF4zj06g5I2
 6Jxk295Knau4XVtV46mPjCpRhmXeXmFqFj0a6uPvdIvG/Y+rMOZbvkvpXgEGQ7stq33vvKKyIo/hV
 3bDlLVPmO2bXh3Eumz5/H7PD9Xf95EUgZUxgvPHHnBxmIvpPwXpLDRjVS3DY4ncR1hi6bjO2f9ErB
 Sw7jZRVaQA0Bz5UK73ezEKhOR2aS8BI2Yf8Qg5UYt6I6yzJY7GVlkgcE0J0Wnm2/lmDkd+4PJgHRA
 p8wQdj4g==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1oEnjp-000ts1-3s; Fri, 22 Jul 2022 08:10:21 +0000
Date: Fri, 22 Jul 2022 01:10:21 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <Ytpbbd+dlUQnO6jb@infradead.org>
References: <20220722071228.146690-1-ebiggers@kernel.org>
 <20220722071228.146690-3-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220722071228.146690-3-ebiggers@kernel.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Looks good: Reviewed-by: Christoph Hellwig <hch@lst.de> 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1oEnk1-006gse-GO
Subject: Re: [f2fs-dev] [PATCH v4 2/9] vfs: support STATX_DIOALIGN on block
 devices
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
Cc: linux-block@vger.kernel.org, linux-api@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Keith Busch <kbusch@kernel.org>,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
