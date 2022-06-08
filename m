Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 773525428D6
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  8 Jun 2022 10:04:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nyqg6-00021o-Jj; Wed, 08 Jun 2022 08:04:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2) (envelope-from
 <BATV+ba9ae8ab3d8ecaf97ba4+6863+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1nyqg4-000210-SA
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Jun 2022 08:04:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=; b=mXIvR7k/zLBO0phG03PxjQG0E6
 faAYfoBJTlCRY459r1wMpxNBpTHFgXpQ1309losbF7AjtW0N/QqEJsWQ32kJ/dWSvH8STOXGY4TUg
 SQaLanfnqRqrr/06ahKj3gk1yhBDMow9libb6mw3j8LBGpipkpy46Pv/MB3RYd698i1M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=; b=MbR3a6SnOZUxsMha2IfPJjBNUq
 BBRG5HuEFsJIBs3+mjaKLG4KHuZPPD0MafK/O+Ymdgkkh18KmUDiLd+wFF+BhAjxxRfLVEhqA6pZg
 rwc0mmArRrqZgg4VKUqn97sDqe4RwZqxjKQ/tV/1k0WlE2RzapOi8qxhZSnqX85jqzeI=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nyqg4-009a45-J6
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Jun 2022 08:04:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=; b=l7NT0ps+5Sa+CTK3H9hfJji4Fd
 A7zNd6sKSO21jiFel/Yej67cZcGS8Ks/1Nb+KruI8rTzKZY/l6nUl7fe1mhKhtHOKgFOLFpCU/I/G
 cP/mswbGcgITkNlQgIvaPGgYDXtiGSCr4xWVnIwAtN29JyYy+jnTPkkJrzAdQxZq9Ord8Jn+skutt
 Wrb6S14hig+fqYnKrsb2t0gMBTssRTpRIopwoCZWchk1J7byiNXWATQvPxAOZ2Pw48g8LuX6s5jqy
 eXvItBOcIUJMtZMkd9H0mwoW/g0SRCKPioQvvaw19MER0dpzkRRSveecHr8+snwhAZc8DTbqin7GO
 1gJ0jepw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nyqfx-00BoJo-JM; Wed, 08 Jun 2022 08:04:25 +0000
Date: Wed, 8 Jun 2022 01:04:25 -0700
From: Christoph Hellwig <hch@infradead.org>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Message-ID: <YqBYCdMaaSNfBIF7@infradead.org>
References: <20220605193854.2371230-1-willy@infradead.org>
 <20220605193854.2371230-7-willy@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220605193854.2371230-7-willy@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Looks good: Reviewed-by: Christoph Hellwig <hch@lst.de> 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1nyqg4-009a45-J6
Subject: Re: [f2fs-dev] [PATCH 06/10] hugetlbfs: Convert
 remove_inode_hugepages() to use filemap_get_folios()
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
Cc: linux-nilfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
