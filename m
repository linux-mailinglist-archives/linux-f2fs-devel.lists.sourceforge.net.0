Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BEDB6DD17C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Apr 2023 07:20:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pm6Qa-000367-Je;
	Tue, 11 Apr 2023 05:20:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+c6fa32d9e84a85109083+7170+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1pm6QZ-000360-HY for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Apr 2023 05:20:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6nX5sI6EN+QIsWtAaq5RhWz/W4vuyCGzISy2tTv8b6w=; b=eYiBsl1kaQqV4+httY8Epc2Mau
 9aMTlNxckgUABEPj8SYlpKrZICwIqBCxS5u2LFGiO4ZMtJo4eTGVsBPLzVskXjKJjAd9NwxX2M9oH
 e5OI5XVGSOWwa0mo9nPSzbc/nBmHiJsaB+0JHLBY23X9moS8ZmXTgsrWUXDoBy106jLA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6nX5sI6EN+QIsWtAaq5RhWz/W4vuyCGzISy2tTv8b6w=; b=kdWFGciT/pjVN15yzE4K7WzjmE
 snXYLekNFK3oW1zRPcOJwwTBhqVgzKGrhJTbojk3X/+yC1GqrYzHOOjuKbmDqvC7PaHt1vUHd4zhn
 YmbDjDf6T2905GAJU1FuHfAtxWLFja4z4F5aRsVMeSPMIFFLn19/lz7iqu8SmF5w7Qic=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pm6QW-003lT7-1n for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Apr 2023 05:20:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=6nX5sI6EN+QIsWtAaq5RhWz/W4vuyCGzISy2tTv8b6w=; b=k1nDyW9ThWdwLT7pSWirEu8vAz
 5gsYJWy42X4KvcpSpeCIEbOYds8a6VmdcdtnrFfTUZOMfEQkb0BOzhlbMIm5cunipw+jcMqtf6L/r
 FPpApigHLGsj0AbugbMiQtHKiTFGY9ozfe/zBscnPg1Mzgw7dPOExuqFoZe1d4/QjfAIxWMa+PTwM
 0e/gNRrYWpCr+ICTg8kD6Z7Kzqr7DVQAQCnWLRdiGK4HSeKC67KTJGD8gscP39JkuZlIwihkF+6hw
 gY+QlKY1Wbp8V4K0W3LfRl2b/hiI8yJJDxRKMbrd7FtzqjIBqzmCFNIpdbdq70XMfufV+YB7upDdm
 vTfdPYZg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pm6Py-00GReU-09; Tue, 11 Apr 2023 05:19:46 +0000
Date: Mon, 10 Apr 2023 22:19:46 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Andrey Albershteyn <aalbersh@redhat.com>
Message-ID: <ZDTt8jSdG72/UnXi@infradead.org>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230404145319.2057051-1-aalbersh@redhat.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Dave is going to hate me for this, but.. I've been looking
 over some of the interfaces here,
 and I'm starting to very seriously questioning
 the design decisions of storing the fsverity hashes in xattrs. 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1pm6QW-003lT7-1n
Subject: Re: [f2fs-dev] [PATCH v2 00/23] fs-verity support for XFS
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

Dave is going to hate me for this, but..

I've been looking over some of the interfaces here, and I'm starting
to very seriously questioning the design decisions of storing the
fsverity hashes in xattrs.

Yes, storing them beyond i_size in the file is a bit of a hack, but
it allows to reuse a lot of the existing infrastructure, and much
of fsverity is based around it.  So storing them in an xattrs causes
a lot of churn in the interface.  And the XFS side with special
casing xattr indices also seems not exactly nice.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
