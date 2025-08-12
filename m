Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 12487B22015
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 Aug 2025 09:59:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CvpNcvVyqhagw9lw0vgOvJao/WqMFiAudVF339aEOh0=; b=k3DYWJd5XIx1IWI4RVB//MPwF6
	0uF1B0+Q59t293tfNkkIx33pJ2LybyuetrjRy/+eHVgplTQlrzrYEqtdZsS2RIGpr+zmAkXnGAw+q
	O9CyYmQM+WsmORWvAQBvrPCLgfvKknFNTwbRabvKPM7L2Ugjnc6pth/r7TQYDBS/aL7E=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uljuk-0001jT-MO;
	Tue, 12 Aug 2025 07:59:22 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+01f4a5ca6254e61d0c65+8024+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1uljuj-0001jM-Ll for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 12 Aug 2025 07:59:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Vd1f/4Sp7X7PECw8VCBF/HCYX3GWhKDPDeSyyBxNL0o=; b=J9fMlyYnsV8j/Wqrd0ffgl3qYS
 JFx1zyx6I8jNvOwstTD/kfjLnkSmcj3CuEVBhIQh8IxJKbdH9GBa2hzrezhU0t8TVCpAiS511hEwt
 1BDtMbaH7XWspWwSqs9jAi8sfx9zvrIGZSjh4bv95mLd3J9Kx/8sXi/HED6wLR83NdGU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Vd1f/4Sp7X7PECw8VCBF/HCYX3GWhKDPDeSyyBxNL0o=; b=GnHcoWeDqnJ3/2x1VhZG/eTEKW
 tXLRg0bS2N11/2SC3bWEs7mz4c7C04+cNP11ibgbNfXGXgQtfUA7iUsXJE5Hria84jV5fIeeW8E/3
 a0JU94WvAdQ3v1rf02Xxy78N27nGCSkp7FF6iQUl8dmJYivKnPAWSsdQk0pYSXerX+uk=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uljui-00042F-GN for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 12 Aug 2025 07:59:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Vd1f/4Sp7X7PECw8VCBF/HCYX3GWhKDPDeSyyBxNL0o=; b=belUHZ5wnvzwGG+QVZgWBECz07
 H+yQPI+U+xjeTV4rMC6T/tolOAGXgux1DhEgBcB8qF2ZPrCrWxRM+nX4Ink/cdL5uCFnG+u9ogJU5
 n6GwC6PT4UmbFBkf66HmSAQT4tXZUPDZ4jKw+FbBZCG4B1Uf/zlHySxvq3UogpBeRJ/bCKaojpkrt
 ghwOMEGWoPj+iymXYuf+BHktP8CVDfV5UykJJACstqvhec+DAeuSoxrZTPP5EeoKvgr6O+m8s3g4y
 oQvuFUY52hwL5uQ1r/eehnN5SdMPalKRqjegYNxaccEx2rA9QRh20c2wAoIEV6GSVSnNzS6J9jLeN
 en+D4YxQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1uljuY-0000000AAuT-1FIF;
 Tue, 12 Aug 2025 07:59:10 +0000
Date: Tue, 12 Aug 2025 00:59:10 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <aJr0Tk36ZNiCg8mQ@infradead.org>
References: <20250807034838.3829794-1-chao@kernel.org>
 <aJnLXmepVBD4V2QH@infradead.org>
 <c5195d5c-5f71-4057-9522-228b48e4cd90@kernel.org>
 <aJruCTOjcj1nEk-S@infradead.org>
 <dec5b832-53f1-4274-902c-418f01df9458@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dec5b832-53f1-4274-902c-418f01df9458@kernel.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Aug 12, 2025 at 03:53:54PM +0800, Chao Yu wrote: >
 > What did you use before? At least for older qemu the default was > >
 buffered
 I/O, which can lead to very expensive fua or flush calls. > > [...] 
 Content analysis details:   (-0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1uljui-00042F-GN
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: introduce flush_policy sysfs entry
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
Cc: Christoph Hellwig <hch@infradead.org>, jaegeuk@kernel.org,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Aug 12, 2025 at 03:53:54PM +0800, Chao Yu wrote:
> > What did you use before?  At least for older qemu the default was
> > buffered I/O, which can lead to very expensive fua or flush calls.
> 
> Previously, I didn't use any cache= option, as manual described, it
> should equal to cache=wrteback.

Modern qemu actually split the cache option.  You absolute want
cache.direct=on.  If you don't do simulated power fail testing by
killing qemu (or run real workloads for the matter, but who does that
:)) it might make sense to just ignore the flushes with cache.no-flush=on
as well, which is what I do for my test VMs on the laptop.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
