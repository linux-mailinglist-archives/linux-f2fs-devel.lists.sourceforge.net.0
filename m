Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C7892E2D1
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 11 Jul 2024 10:55:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sRpaN-0006D6-3z;
	Thu, 11 Jul 2024 08:55:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+0824af431c6c2c2a24c5+7627+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1sRpaK-0006Cz-Ay for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 11 Jul 2024 08:55:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IoLwNlzL5pVMes7pL0SN66rptxB5HrdHgJG/HnPw4go=; b=g78niCAra9t8/rhcicyETgPC3O
 VfGMapirmXc5p5BVx5I00NPwk7Mb+bCQP1pRYwOpkNr4kGK5mle47JOLdD39ZqlakNRrfvS+0afiz
 FiObV5aQOkz0KFFJmnyLj6NE6vi948R+KPWFZNjcIbuqHpWWmbVIbt88vXcizBP/Ky88=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IoLwNlzL5pVMes7pL0SN66rptxB5HrdHgJG/HnPw4go=; b=JCmUV73b64D0IRtbKJ9OynBhwj
 fqxzXM1zKqHvUT7CKRiWVOPg0Tk5bq6iiCLyaSx5jj7fEr6eeErU4si07OgSRDxE/nsaOLLragLX1
 BUXV+OEA3xHwpDkYuXy+7ZIv4lMrpOBixOCcvc33tYpHqIdba2F54nQbsiOCu7AAqDe8=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sRpaJ-0006pq-FR for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 11 Jul 2024 08:55:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=IoLwNlzL5pVMes7pL0SN66rptxB5HrdHgJG/HnPw4go=; b=PQaTuRoAFO4mYSXAy4lP5USzkH
 J4gUlSWhlzUH/NiDp2KgLiNQyEPTdMu168GNAB9Xrv/R/ZrGvfNdcgkIvvJIWj09Vgk9a8ggoHSFy
 2KdfrQSuu3vW2ButEYbttpqj5waDZW3iB310fOAvvWUrQ0P6VtNMOZZhB4EdwxlfRxhXlznlQ+YqR
 F/JweXuda1clgoNwnhjEhvu83qwhnqHcOpvSIE+DVIhIpDdijDtzz2i/7LW7MTKT26TVRbl8P1zD3
 0Ng39ttpebR98ql+1a2w6xoV1vfdIooxibBfDUpFPdCoZXuIPevrR572JixXR9My07LBNLwmXvfyR
 XMs3+RKw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.97.1 #2 (Red
 Hat Linux)) id 1sRp8E-0000000DAT4-2xks;
 Thu, 11 Jul 2024 08:26:26 +0000
Date: Thu, 11 Jul 2024 01:26:26 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Youling Tang <youling.tang@linux.dev>
Message-ID: <Zo-XMrK6luarjfqZ@infradead.org>
References: <20240711074859.366088-1-youling.tang@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240711074859.366088-1-youling.tang@linux.dev>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Can we please stop this boilerplate code an instead our
 __init/__exit
 sections to supper multiple entires per module. This should be mostly trivial, 
 except that we'd probably want a single macro that [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [198.137.202.133 listed in sa-trusted.bondedsender.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [198.137.202.133 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.137.202.133 listed in list.dnswl.org]
X-Headers-End: 1sRpaJ-0006pq-FR
Subject: Re: [f2fs-dev] [PATCH 0/3] Add {init,
 exit}_sequence_fs() helper function
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
Cc: Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 Josef Bacik <josef@toxicpanda.com>, linux-f2fs-devel@lists.sourceforge.net,
 Chris Mason <clm@fb.com>, Luis Chamberlain <mcgrof@kernel.org>,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Jaegeuk Kim <jaegeuk@kernel.org>,
 David Sterba <dsterba@suse.com>, tytso@mit.edu, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org, linux-modules@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Can we please stop this boilerplate code an instead our __init/__exit
sections to supper multiple entires per module.  This should be mostly
trivial, except that we'd probably want a single macro that has the
init and exit calls so that the order in the section is the same and
the unroll on failure can walk back form the given offset. e.g.
something like:

module_subinit(foo_bar_init, foo_bar_exit);
module_subinit(foo_bar2_init, foo_bar2_exit);




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
