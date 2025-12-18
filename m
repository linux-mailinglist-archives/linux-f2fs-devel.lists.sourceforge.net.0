Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7132FCCAAA8
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 18 Dec 2025 08:33:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vc9V4jeAVEXQ0n/PLzE4aNsgcjr3x5A3VnD4W/V+Og4=; b=YoYFRpcxbOLehbcQ03RZr9TiuU
	kVU5lgKxx3Iyvm1nd7rj6UZgUad8/wWSLw4RTIuyP4Q0/vdFWH8f1AOQQNXHN9Un8IBM0A3GuQ+N1
	wu6Ai3Qq24ufRGCGFxO+Gqb5Fbexy/mi9Nt8xz92/giCpno7K6BPrQnjXfsc/RlDErUg=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vW8Vj-0006Ir-Aa;
	Thu, 18 Dec 2025 07:33:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+3d4854a57dc9b1fc88a2+8152+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1vW8Vh-0006Il-Ad for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 18 Dec 2025 07:33:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aM4DalfUBwtqmf4ypjdLzKw0+szTaibZjWJpzqFSTno=; b=ESjz0Slz9P3GTNn+2S8OBfD4Dj
 SFe/RcEU0gd+z7WUEiz1k8+VHp9qmxcvNzxyYvEDL9yRqAHXQlpQ5bVeQrdKgiUU8F8J+vqJYaD+C
 1rqSj0xna1DWzgcyFLl8dUeWM3FsPuHz+GRcQJ4unbr8vo5s3xkvujuu8Bv/CSPWL4BQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aM4DalfUBwtqmf4ypjdLzKw0+szTaibZjWJpzqFSTno=; b=H0C8rt8HpN5nbNm5/tbQM/EK2w
 sdf5DxPkBJhN9+bSMSVJlDm2vIEl9o59jZw1PwFVYO+6vJQG7gDKMGaP6PQS502DRi17T7EXsMdHS
 MNxluSC6jfxLAp9ue8l+o9Ko98GKu9jWnfWC2ND1lLjxU96hBhkoQVBlu1sxbJz+Tjiw=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vW8Vg-0005G0-J6 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 18 Dec 2025 07:33:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=aM4DalfUBwtqmf4ypjdLzKw0+szTaibZjWJpzqFSTno=; b=ht/KJPEC9Xfmf+pnjBjCGJx1Cf
 30TEl3YN/MnUx5SoOOY90aCMndXYe73jLOCqzjwXlyOoOH9+Q+EPIOKmd/8gYli4PPfg67+Gj8i9G
 Y3YVLu3uD+758vwYGRKRFbjfP9/4Npq9Z/gsNRi5pUhKlDQE9jEMnMLRoZXXXrpso7bCQ8bWWjhW7
 +p2ChBmm2kG6prPtzZfQzr95J82S14k+pOa9UmorPazXGO5AKmUwMrCLlNsiMq0boOQwF0uPVSfKR
 Sw2tbnvFymgjM2yzbgiXdXjkV/YkZxGXv3hW9fOZea0wdj/lT86GqAzr5YWCvBGDfHUgrazH9CjvV
 cW9QUksw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1vW8VW-00000007xii-081x;
 Thu, 18 Dec 2025 07:33:06 +0000
Date: Wed, 17 Dec 2025 23:33:06 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Joanne Chang <joannechien@google.com>
Message-ID: <aUOuMmZnw3tij2nj@infradead.org>
References: <20251218071717.2573035-1-joannechien@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251218071717.2573035-1-joannechien@google.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Dec 18, 2025 at 07:17:17AM +0000, Joanne Chang wrote:
 > generic/735 attempts to create a file with nearly 2^32 blocks. However,
 > the maximum block count per file in F2FS is limited by the cap [...] 
 Content analysis details:   (-0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1vW8Vg-0005G0-J6
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Zorro Lang <zlang@kernel.org>,
 fstests@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Dec 18, 2025 at 07:17:17AM +0000, Joanne Chang wrote:
> generic/735 attempts to create a file with nearly 2^32 blocks. However,
> the maximum block count per file in F2FS is limited by the capacity of
> the inode. This limit is roughly 2^30 blocks, which is significantly
> lower than the test's requirement.
> 
> Signed-off-by: Joanne Chang <joannechien@google.com>
> ---
>  tests/generic/735 | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/tests/generic/735 b/tests/generic/735
> index 9bbdf3a1..d5ba5673 100755
> --- a/tests/generic/735
> +++ b/tests/generic/735
> @@ -19,6 +19,9 @@ if [[ "$FSTYP" =~ ext[0-9]+ ]]; then
>  	_fixed_by_kernel_commit 2dcf5fde6dff "ext4: prevent the normalized size from exceeding EXT_MAX_BLOCKS"
>  fi
>  
> +# Block number 0xffffffff is too big for a file in f2fs.
> +_exclude_fs f2fs

Please don't add random file system excludes.  This should be
abstracted into a _require_max_file_size helper or similar.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
