Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AF24A9FABE4
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Dec 2024 10:21:03 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tPecR-0004BU-N6;
	Mon, 23 Dec 2024 09:20:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+2ab8f4ca17c8b03b1993+7792+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1tPebs-0004Au-2E for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Dec 2024 09:20:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FKi6OwAeOuymBx9/APs/sfo5EFcqTrkzLfNDNZUJI1w=; b=ggFoK8P1ca2i9p5yaaLfqwFkh+
 KHde5ghfjtAsPHBRroMu84N3icvVce0jtA4gOlM0MHBxsOhulb+Ag7aoRQCJZZRwbz9j5j1Vfa6/c
 lZghVCHPjdocHJ5Zsp4ga6ysTzeRsSo/gQ4ErpVbdFK1PceeU9OO8fpv2mekjuNm1me0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FKi6OwAeOuymBx9/APs/sfo5EFcqTrkzLfNDNZUJI1w=; b=nDaQQBfQJnB6p3fr9BWmHCB6ER
 nTLVihGbKIWRwPG/NLhP6e73EQm1oiFQGJDiN6g9TaCJkggncrKWlsvslna4ys7tO9/2M2fv1RER3
 FY0zxKFgfJgcKrzepSk38EaO7kdfRdzi50WRAPM+QpzX9zkeJI/8O0qqde8U2gsQWxYQ=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tPebo-0000al-GL for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Dec 2024 09:20:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=FKi6OwAeOuymBx9/APs/sfo5EFcqTrkzLfNDNZUJI1w=; b=cCBA5bDYEAyVjJNvvcO/dtJz+c
 J/pxz4lGXMpPgBsRbOKaZM38jHBYtbPLn7P4uTh3mNiY9VfQ9SoTuVNMfzX+WSWq1nZHs5IU9RNz5
 j6/MeioDZEjKY2GdBZlwPCdFGEoT+9gID94R4wyRnWWulOaNbp+/FjcA8yVZ/jWfKFmadGO3I13p3
 kKPURLRO8LYR9dvTPPxmbRgeGvLBbVN6P6acfIT0+KKrV2GXwskLvCydtfosR2Jge2pDM6DPudTpS
 8sbq0/TG3j1gUhPacO9GEAOC4tV0RnO1SWZOBkJpQtXHo3hZuKzehaxpqZWWHJ49PH3hAm4Yocs5B
 QGkixDLQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1tPdlm-00000009aNp-3zRF; Mon, 23 Dec 2024 08:26:30 +0000
Date: Mon, 23 Dec 2024 00:26:30 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Daniel Lee <chullee@google.com>
Message-ID: <Z2ketmZiWmUVddpt@infradead.org>
References: <20241220172136.1028811-1-chullee@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241220172136.1028811-1-chullee@google.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Dec 20, 2024 at 09:21:36AM -0800, Daniel Lee wrote:
 > This patch addresses an issue where some files in case-insensitive >
 directories
 become inaccessible due to changes in how the kernel func [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [198.137.202.133 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [198.137.202.133 listed in bl.score.senderscore.com]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1tPebo-0000al-GL
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: Introduce linear search for dentries
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Dec 20, 2024 at 09:21:36AM -0800, Daniel Lee wrote:
> This patch addresses an issue where some files in case-insensitive
> directories become inaccessible due to changes in how the kernel function,
> utf8_casefold(), generates case-folded strings from the commit 5c26d2f1d3f5
> ("unicode: Don't special case ignorable code points").

That also breaks all other direct hashed and needs to be fixed.

> 
> F2FS uses these case-folded names to calculate hash values for locating
> dentries and stores them on disk. Since utf8_casefold() can produce
> different output across kernel versions, stored hash values and newly
> calculated hash values may differ. This results in affected files no
> longer being found via the hash-based lookup.
> 
> To resolve this, the patch introduces a linear search fallback.
> If the initial hash-based search fails, F2FS will sequentially scan the
> directory entries.

That means you have really bad worst case behavior for negative lookups.
I don' think this is in any way a good idea.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
