Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7507FCCE88E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 19 Dec 2025 06:30:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P3xwDvhEEAGUUCnhwb1PjVPi2E29z1JZMj57oBHlg/8=; b=A4hJPGkL5n16gapEEBxLbzwnuF
	IHQCAK1lqnbCxze9jE+Vfqf8rsDrPVES3CgFU+FLvQzbvu00EBPQdNl00A04Vmm4k4UJwtUEnopvy
	K707yuWnAMJ9N9DvzQuzvZBlfNIwphdNd0GCVZug9hp8zoR1g0EBB66jpi+qAOHqM6bk=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vWT4R-0008N4-B8;
	Fri, 19 Dec 2025 05:30:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+888018f8e62d1476e86e+8153+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1vWT4G-0008Mr-98 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 19 Dec 2025 05:30:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yBdvfHBasrnEFTF070cSt/emoT+E7CbdyD7j8s+6u7Q=; b=LBMVzmwPvAB3Q+omn0wKQJJlDd
 veFsIoNn1EjR4vmuZCUrwHfn31fkeUqw6oHalBUj/z48Ymq/PZ5i9jCkRNfltaCQ7i8LjWbImnYEL
 y/nWoDVWqhBA0ftwNICVHXugKkLD6jQsHx2Cheq12o5qsIkvaW1cDE+n7RuF9iKwzVkk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yBdvfHBasrnEFTF070cSt/emoT+E7CbdyD7j8s+6u7Q=; b=IZ/YB7kf/4S0bhb/rbrF2btB1U
 ozKVFbXUpRX3dNdmoy5KNP0BjKQjHufyjxHGvbtejpUs3FFSEu6Wcrl6wDJMnERW9P8VYsEleuEQz
 1N2v5iW+Hryu8UrwAFOYKbtm2OBbZ2DEmkj/TCnITii+M1V79zApP7tbAppJwXO5ryJQ=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vWT4E-0003o4-VM for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 19 Dec 2025 05:30:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=yBdvfHBasrnEFTF070cSt/emoT+E7CbdyD7j8s+6u7Q=; b=rxoP4dEMkOJwSZVmdT3KZhBcDW
 aSF7Qi1XqLcC2/Yx3sl5HWOKYAQVVhU3uvM3w+Ip8tmcMEXMVGuhWugrpmaL72N/J41wlmDy1QPU3
 BiKLIXXqMGXHhAxWhdJ7jVZpraDMX98s1V4DAnonFCx6OIrElZlP8/io7XXoxleY+JdPYDtCAJ99j
 vJtX+r4/VtBxD+qfe6H7i8Scu0isQrNe3xMMTrMMUaffDLtLL9ST4BXMLMFF8lziCUtS9KNFNW0/X
 vl7rWBCBd+/LXSw4q66w4f+J0fDmRrL8LPNcuaiKiqDYUyxxPZ8s5hwPufIX2miSKipo4VxanK3SP
 hfSxbYHw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1vWT48-00000009eLX-0v3v;
 Fri, 19 Dec 2025 05:30:13 +0000
Date: Thu, 18 Dec 2025 21:30:12 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Joanne Chang <joannechien@google.com>
Message-ID: <aUTi5KPgn1fqezel@infradead.org>
References: <20251218071717.2573035-1-joannechien@google.com>
 <aUOuMmZnw3tij2nj@infradead.org>
 <CACQK4XDtWzoco7WgmF81dEYpF1rP3s+3AjemPL40ysojMztOtQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACQK4XDtWzoco7WgmF81dEYpF1rP3s+3AjemPL40ysojMztOtQ@mail.gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Dec 18, 2025 at 08:02:48PM +0800, Joanne Chang wrote:
 > Thank you for the feedback. I will implement a > _require_blocks_in_file
 helper in the next version. As far as I > know, there isn't a g [...] 
 Content analysis details:   (-0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1vWT4E-0003o4-VM
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

On Thu, Dec 18, 2025 at 08:02:48PM +0800, Joanne Chang wrote:
> Thank you for the feedback. I will implement a
> _require_blocks_in_file helper in the next version. As far as I
> know, there isn't a generic way to query the block number limit
> across filesystems, so I plan to hardcode the known limit for
> F2FS within the helper for now.

Oh, the limits is not the file size per se, so the number of blocks?
I.e. you can have a 64-bit i_size, but if the file isn't spare it
eventually can't fill holes?  That really does seem like behavior
applications would not not expect, aka a bug.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
