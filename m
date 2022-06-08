Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF89542938
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  8 Jun 2022 10:20:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nyqv3-0002O9-Nq; Wed, 08 Jun 2022 08:20:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2) (envelope-from
 <BATV+ba9ae8ab3d8ecaf97ba4+6863+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1nyqv2-0002Nf-Cr; Wed, 08 Jun 2022 08:20:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QT2oIDeJNUc2ojFPGUttSkHbitBmnZ3eylc7PwUBiqw=; b=NA2TlXYAcrOtx8kW/YCILpWOBr
 v393jouBkSfTo1Na91KYPeW+8rS4ct6XdBPorVgFkJBpPRBlYnPC0bxTRbTQimH7cTnTOnnUTzde1
 W9myAQz9pk5xd4eZXburqo6Y6eoYZATEITRWAeYlODiVugQ++bOJWQuEEQEPMOvV2cKY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QT2oIDeJNUc2ojFPGUttSkHbitBmnZ3eylc7PwUBiqw=; b=bUgG3BpUOkrWjbAUEHw3Jb0zPQ
 FAcyckVWllGuZEMyRZLY6f5wsSrsQ/5GIsBX8P0DbF4221GyoiKJuELU8yvL6bNlwBdvKyAWyrJu1
 YHrbTts75P8eiQIi2E9WOvjGtEiEOJr9pd5ApUXVgYpdm3PFh8pekLV56rj3hcbRYF/E=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nyquy-00059O-Pu; Wed, 08 Jun 2022 08:20:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=QT2oIDeJNUc2ojFPGUttSkHbitBmnZ3eylc7PwUBiqw=; b=DQgbhPr3EtdPNe47+1otY6YBJ2
 glTpzusE/3PlFzZ0wogFOE34/jPjI4HFO5cnQgwwiMpFqBKOgjoXbP0RT1mVZp5o1dzq7DSdipebx
 mskJ4CjHJTxc92puWMRmsM7z6maVcYgq9KpF2GPfD5Kat/I2wduKTfHirJfv5i2KIHVA5JzPDIiI2
 lCeBxQ/yPJDj6/LduSFmHxWv1e4YF2Pj2LlDRD0cYcFb6hHpjmH59it0vinWU2nedskYtbfvk4NqO
 0o2MsEcFJ/qxp8wnZyw+NP5jNLRSGYQd3a/fAKXnbGlN6e5TJxP9CWfFegbEyAGvjblO83DMFzvRY
 7Jw3MvhQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nyqus-00Bu45-Rw; Wed, 08 Jun 2022 08:19:50 +0000
Date: Wed, 8 Jun 2022 01:19:50 -0700
From: Christoph Hellwig <hch@infradead.org>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Message-ID: <YqBbpob9igYBSWGr@infradead.org>
References: <20220606204050.2625949-1-willy@infradead.org>
 <20220606204050.2625949-11-willy@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220606204050.2625949-11-willy@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Jun 06, 2022 at 09:40:40PM +0100,
 Matthew Wilcox (Oracle)
 wrote: > Use filemap_migrate_folio() to do the bulk of the work, and then
 copy > the ordered flag across if needed. Looks good: Reviewed-by: Christoph
 Hellwig <hch@lst.de> 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nyquy-00059O-Pu
Subject: Re: [f2fs-dev] [PATCH 10/20] btrfs: Convert btrfs_migratepage to
 migrate_folio
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
Cc: linux-aio@kvack.org, linux-nfs@vger.kernel.org, cluster-devel@redhat.com,
 linux-ntfs-dev@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-mm@kvack.org, linux-mtd@lists.infradead.org, ocfs2-devel@oss.oracle.com,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-xfs@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Jun 06, 2022 at 09:40:40PM +0100, Matthew Wilcox (Oracle) wrote:
> Use filemap_migrate_folio() to do the bulk of the work, and then copy
> the ordered flag across if needed.

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
