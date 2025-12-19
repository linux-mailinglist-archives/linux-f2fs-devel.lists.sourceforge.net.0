Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 41155CCF895
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 19 Dec 2025 12:10:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2eXUJc7wRaC00pP2gsP8hPEZDmZebCVJy5Mx6FS0ZXc=; b=UsPEbi6p4hWs/Ql/63RLTffzQO
	NhgCVEytqfMFxKs85zHhXbPe7LmXr5KF6i+aZm/+2BRkeDezsKOMxMYgn7emT0ajAZs0DZA3JL6io
	kPUiXHvExyY6+qOWnmbefPLf49/BxemtDm9G0zpefEF+ISWDkbtSOSoc7lUKtjg5OV4I=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vWYNO-0008Dn-3v;
	Fri, 19 Dec 2025 11:10:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+888018f8e62d1476e86e+8153+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1vWYNL-0008DW-Ua for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 19 Dec 2025 11:10:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=77glmLHUn38+bjFwaQX0aUFqGU278qbMfSMlpnIXh9Q=; b=Xwf13x92GQwSJm43QsZ3OUGe9Q
 kgHZjOfF9K2NqHZFfiq1ohpIY7Lz432h0sgw/Z8/jiRCfmFV8N+QOj585cr6IasgWiPBQG2qQcqDE
 G6/5NxCF/gxMq2wATsf8tr7Mj3vm9D+vqbJulTa5rlSsqJDGf6hX5ZaUKbkrQL0t5TDM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=77glmLHUn38+bjFwaQX0aUFqGU278qbMfSMlpnIXh9Q=; b=Asp4QEhCiojvGg6TR/AV3QGZFh
 JXB6kjr4PdwVlW+EM0uWLVC7cMpG72Ffr48RRmYfixIG+oyLwMCDbNI0LMGA2ENTKh0HsCelLbfjm
 pHxEEz/NqaHWrP80W9WUYS+ea38f4TegKwYOysZtUwIW07MEdFumaL7rUMCqjmwPRE0M=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vWYNM-0004gv-5t for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 19 Dec 2025 11:10:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=77glmLHUn38+bjFwaQX0aUFqGU278qbMfSMlpnIXh9Q=; b=QUu/BlPPopOOjJPBENVYe9e2zd
 Rwwa1KOm6AX0D8t7dMX8AgblxZ+f/bvv0wzvCBIJbzxaVu4RVeBTNwolVuNdS0PbtI5u3PuDHZYwv
 PUbmh8AWksaiStR/VhSELAEcYgwsr7cEYvP2RQTJ81H99ZXltiGAw8A3W3wM1ueDVIO8VuxnH6MgH
 dPbDdiCB1q3UmHcWvTu6LAaFOLwhbiRkY1jQF7G9zzNeb4m6wNYTYByMRqlLlGFK1ccWeD8dRSIp1
 GtXK46QkPVV5s6Bb4xEiJ43xjdwmR0eh5u6pi4ccIhHQY/sCMtnuCcZGC2VYt6TPnwZqhTRqKeTFj
 JXm29eVg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1vWYNG-0000000AAoe-3YGk;
 Fri, 19 Dec 2025 11:10:18 +0000
Date: Fri, 19 Dec 2025 03:10:18 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Joanne Chang <joannechien@google.com>
Message-ID: <aUUymqMO4RfK8thK@infradead.org>
References: <20251218071717.2573035-1-joannechien@google.com>
 <aUOuMmZnw3tij2nj@infradead.org>
 <CACQK4XDtWzoco7WgmF81dEYpF1rP3s+3AjemPL40ysojMztOtQ@mail.gmail.com>
 <aUTi5KPgn1fqezel@infradead.org>
 <CACQK4XCmq2_nSJA7jLz+TWiTgyZpVwnZZmG-NbNOkB2JjrCSeA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACQK4XCmq2_nSJA7jLz+TWiTgyZpVwnZZmG-NbNOkB2JjrCSeA@mail.gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Dec 19, 2025 at 04:53:04PM +0800, Joanne Chang wrote:
 > Thanks for the reply. To clarify, I meant testing the architectural > limit
 of blocks per file, not the current free blocks. Sorry for a [...] 
 Content analysis details:   (-0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1vWYNM-0004gv-5t
Subject: Re: [f2fs-dev] [PATCH v1] generic/735: disable for f2fs
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
Cc: Zorro Lang <zlang@kernel.org>, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Christoph Hellwig <hch@infradead.org>,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Dec 19, 2025 at 04:53:04PM +0800, Joanne Chang wrote:
> Thanks for the reply. To clarify, I meant testing the architectural
> limit of blocks per file, not the current free blocks. Sorry for any
> confusion in my previous reply.
> 
> The limit is indeed the maximum file size. However, since both the F2FS
> file size limit and the test's requirements are calculated as
> (block_number * block_size), I believe it is simpler to just test the
> block number.

Well, for the file size you can test by doing a truncate to the expected
size and _notrun if not supported.  I can't really think of a way that
easy to directly check for the number of supported blocks.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
