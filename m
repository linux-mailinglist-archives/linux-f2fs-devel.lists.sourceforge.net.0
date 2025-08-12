Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 611B6B21F88
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 Aug 2025 09:32:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jE55yiaOkylN82OBH0tzsVn/QCMzWlllCpZnhGrf2G8=; b=AVwui6+elxx1XWfEEogouiKHHt
	MXBBXSsc7m4bVC1gtx/TgNYUbqjqsIVhrtCNO4SBC2PxseZnqtc1TA3xXrRTGIWzw819rgkBi1wId
	zjja2ThICSQaaFrg4KDjQ/ztGS+x6ow0108UaCltFUcXShdeMgxRYQLAQiNySNGx+xNA=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uljUp-0001Vz-97;
	Tue, 12 Aug 2025 07:32:36 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+01f4a5ca6254e61d0c65+8024+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1uljUm-0001Vd-Ph for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 12 Aug 2025 07:32:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2nTia5ts+VjOnB6KoRPEICX8cfIqCEHm8VoqRMMJHVw=; b=MuPqO6bOA9O/oBmMIOC8ZrFhbA
 jdgDvAGRpf1p0wS/X2r+SKo/NS+lDaYnC68RcMpkf6WkD8q5cB/YShXY1vha9HniuTJ0Zuu+zQ6BH
 dFfBd6F3dXpOB27nH5KsDgl3CqgumJbtROupPTA+O5xtQXrA/Q4j6A+mS+owCd6KK9lc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2nTia5ts+VjOnB6KoRPEICX8cfIqCEHm8VoqRMMJHVw=; b=egiG2UWgPu7mskKTbQDQHAWuY0
 NNvgldg0BsNm4ENqnS1f4M0rwwATg0vdS0AdtQA9d6bsMh9hW1p10+UJpNkNHr1+vBw+Ow+DK0VBz
 0Va2tlZd008GUTOwC8dYOClxAQw7IVDaWb8j3pif2qkiGNxQ0dqWbh2rdpjgq8yZHybA=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uljUm-0001VN-73 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 12 Aug 2025 07:32:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=2nTia5ts+VjOnB6KoRPEICX8cfIqCEHm8VoqRMMJHVw=; b=vWA+OhBmwsieByOdybHKj1jR8X
 B8uftFHEs/UuURKKK4pGRkm9G1XUtLiibtdrtoYkFkZNieGxYAmSJYjJ0An2Pg3g99rLGPAykba/w
 Yr7V6Nor4CW62aekr3V1/p8UerLCqCwI2GhWZkN71vpVUgT0bADtVPAdw9Bjn36tkjoonq/PMdDHU
 KJ4FhNQ8rJQBNmdYLbU/MkL2+JvafMVTZvEVG22gSPApuBkC1FRkc5dfle7yUxSR01HqQ/D/FUX3k
 YLsqaY7Whf6fbv28qTRrUMYa3uvexemuKv5+q8BWgNUR5En9pA346hDSxP4AiShOQnnrsFoZkdWKA
 2iuVRLcw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1uljUg-0000000A7cu-01q7;
 Tue, 12 Aug 2025 07:32:26 +0000
Date: Tue, 12 Aug 2025 00:32:25 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <aJruCTOjcj1nEk-S@infradead.org>
References: <20250807034838.3829794-1-chao@kernel.org>
 <aJnLXmepVBD4V2QH@infradead.org>
 <c5195d5c-5f71-4057-9522-228b48e4cd90@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c5195d5c-5f71-4057-9522-228b48e4cd90@kernel.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Aug 12, 2025 at 02:28:46PM +0800, Chao Yu wrote: >
 BTW, I suffered extremely long latency of checkpoint which may block every
 > update operations when testing generic/299 w/ mode=lfs mount opt [...] 
 Content analysis details:   (-0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1uljUm-0001VN-73
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

On Tue, Aug 12, 2025 at 02:28:46PM +0800, Chao Yu wrote:
> BTW, I suffered extremely long latency of checkpoint which may block every
> update operations when testing generic/299 w/ mode=lfs mount option in qemu,
> then I propose to use PREFLUSH instead of FUA to resolve this issue.
> 
> "F2FS-fs (vdc): checkpoint was blocked for 24495 ms"
> 
> I just realize that using cache=directsync option in qemu can avoid FUA hang
> issue, anyway, let me test more w/ this option.

Well, for decent qemu performance you always want to use DIRECT I/O.
directsync is generally not a very good idea as it forces every write
to be synchronous and will give you very bad performance.

What did you use before?  At least for older qemu the default was
buffered I/O, which can lead to very expensive fua or flush calls.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
