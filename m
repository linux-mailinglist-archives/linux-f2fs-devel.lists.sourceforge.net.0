Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E71326D675C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 Apr 2023 17:31:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pjid4-0001Oq-Tp;
	Tue, 04 Apr 2023 15:31:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+8568051c7530f6265d9e+7163+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1pjicw-0001Oi-0N for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 15:31:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oRUY6/nVUdkJWa+BgfeeaayCjIWt7sUTbaMHlXagjNw=; b=jJ7CO+jfYQDxdHL/2EBm+3mkej
 /+JNIujNtXd2twYDCvTXqJS0lEa/vTr28POMO5LUE5s/fccGAP4vxa+9ctFtlRgGoBRs6BMSi2r+q
 5VxcKuGfL1+ZpeOb+Rw5gu4i+WrzzX73e/CLQkwbXJ+7b3fgkSjZ000XfAkbZL5rpqtU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oRUY6/nVUdkJWa+BgfeeaayCjIWt7sUTbaMHlXagjNw=; b=aqdNYkotL434cYf3STctvuKtVb
 9TEgrPgqGw6UTh/DHOF7pPs5PO1n1Ze8rtl4Y9mHJvx0IhLVsRc3ahHufX6RsR9/4jysOK5bcUovi
 X9T08EVq4ily0vPVIYfPiFZbQ9GjYpYtPzPLFUfLL8GYuDVaUwZFXNcnNRdu5L05qRr8=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pjict-0004Rl-5F for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 15:31:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=oRUY6/nVUdkJWa+BgfeeaayCjIWt7sUTbaMHlXagjNw=; b=Fn5hZQrai6OxRnc53wDWJvsQUi
 l0f2jY/0e+u5hzy8V4qA0uX6eNIA0HL+/ThjvZ+58OfHp5yJqwS4UwWtJa85+FoQv1YOF18PQ8y/e
 fZlpCpeR10Vlao2xf/ZiIbKLawae3/lvFHmhVGCbU5EseY8BqD2Zq9XQmLqu1Rs3Ie8J+zOpNJhqg
 WOPGvV+nuedhEDvyiMY4PKQZIb21ECVPvSGrC0nkv5nmqQuhLqlykdFWXGNzzFth3lMtIfRXD4Co3
 i32ooWz4rlCAa8EN+liRSIfzaYutkEpt2RTf3KItD2VFGXXaziebwy1oggfRtL771dhH2RwYQSCtU
 E2Ik6G2g==;
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pjicG-0020iL-1q; Tue, 04 Apr 2023 15:30:36 +0000
Date: Tue, 4 Apr 2023 08:30:36 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Andrey Albershteyn <aalbersh@redhat.com>
Message-ID: <ZCxCnC2lM9N9qtCc@infradead.org>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
 <20230404145319.2057051-6-aalbersh@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230404145319.2057051-6-aalbersh@redhat.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Apr 04, 2023 at 04:53:01PM +0200, Andrey Albershteyn
 wrote: > Not the whole folio always need to be verified by fs-verity (e.g.
 > with 1k blocks). Use passed folio's offset and size. Why can't those callers
 just call fsverity_verify_blocks directly? 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1pjict-0004Rl-5F
Subject: Re: [f2fs-dev] [PATCH v2 05/23] fsverity: make
 fsverity_verify_folio() accept folio's offset and size
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
Cc: fsverity@lists.linux.dev, linux-xfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, agruenba@redhat.com, hch@infradead.org,
 djwong@kernel.org, damien.lemoal@opensource.wdc.com,
 linux-f2fs-devel@lists.sourceforge.net, ebiggers@kernel.org,
 cluster-devel@redhat.com, dchinner@redhat.com, rpeterso@redhat.com,
 xiang@kernel.org, jth@kernel.org, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Apr 04, 2023 at 04:53:01PM +0200, Andrey Albershteyn wrote:
> Not the whole folio always need to be verified by fs-verity (e.g.
> with 1k blocks). Use passed folio's offset and size.

Why can't those callers just call fsverity_verify_blocks directly?


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
