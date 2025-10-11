Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 24595BCF0D2
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 11 Oct 2025 09:13:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0n+ve4DgC4+8YNFkmknr30GwJbhrFaudHJt6u1XEKoo=; b=T/RvN3GZOVSOr2O9cwPyHO2OUq
	7FiVx+w1vdvTgg4JUZ4EJ9/Na/dpxHOROQpIybifV3Q85/BUHkcL0kqHDINPQ4Oibz8LVKEoiTbbJ
	IIXPhmLF6HlotaVJ9mHZ3y9rRYhkcTzcJ91vFrhn/WK1HlihlM6rP1+NXBpbdSSJXpHI=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v7TnU-0006GA-NB;
	Sat, 11 Oct 2025 07:13:45 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1v7TnT-0006Fw-BM
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 11 Oct 2025 07:13:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aGdNynDlVRj0AdPd/38G94zJLq6qcmgMPMgp/6nLqJM=; b=IoOmYpEgEbIlUz6kAk3fCKMaaE
 Rr09vFfhYA28kexDKi2Zn+H/TpPHvWl0DhKnxTA8jYQ4fTd0MHEI/Iyi3WEG1hx+j6Whl/x2BKlRQ
 1WdRk09WI0KMMjI97GyodjYIreinCah50dlsR9Kg+3teyXXeONCPxpajPuyirq6Z/FKw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aGdNynDlVRj0AdPd/38G94zJLq6qcmgMPMgp/6nLqJM=; b=cYFc8rVqtXcFrzJD0sxKPYgR+x
 nyeNLX7LsojUaKh2qlRUWtvb64TRidzS/0zTrlmj+V+sfyCvoX4rGVrjBGkr5jFfuHTtUBUx6nKN+
 6wMkTuco/k+x2jG2yoFTny35cSjay26h5gcsLoBqVPiRYQD7dhNvwGAo2NAqicjRW3Q4=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v7TnT-0008Td-OY for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 11 Oct 2025 07:13:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 342FE41668;
 Sat, 11 Oct 2025 07:13:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0BB3C4CEF4;
 Sat, 11 Oct 2025 07:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760166813;
 bh=Do43WpfLPmpga5YWE6MICXx9omQSNh8hFVG5f+zuSco=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=BUmcN5Ce020K0s0jpIOHTwuIVD0qbBMBGI4Eu27haS+QqJ9Jg9sl9uA3WzS9cMHIF
 MWKs5TUDdGrxpZeWnKK3MoLAob3+DzOW1LPSq/oTqawRptW1lPQHH/ZTDFdyUZhYun
 u19itZeEY2IeVLet5I2HefLqKp+ahOJYlpRGGvR6vhvdtQHkoZ7VFdZYTi9yLyfSsG
 2vVrcxvBPWMFppnuUMYtCLbPD7rIFY0qDzIJTmqnoR6VpBmpgtYE/0R69OW7Hp2NhT
 WZ3fpel0hmVIgGUNusRofqqHLyUJIgAc8J0wVWC3MPYKFeLXcWTqjL6UuwB8DdrUGR
 ElofHPU+OimNw==
Message-ID: <508e5cba-6523-41cb-af38-0e8dbbce6cbc@kernel.org>
Date: Sat, 11 Oct 2025 15:13:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jan Prusakowski <jprusakowski@google.com>, Zorro Lang <zlang@kernel.org>, 
 Eric Biggers <ebiggers@google.com>, fstests@vger.kernel.org
References: <20251006095813.3497619-1-jprusakowski@google.com>
Content-Language: en-US
In-Reply-To: <20251006095813.3497619-1-jprusakowski@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 10/6/25 17:58,
 Jan Prusakowski wrote: > verify_ciphertext_for_encryption_policy()
 checks if encryption works > correctly by reading encrypted file's contents
 directly from a block device and > comp [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v7TnT-0008Td-OY
Subject: Re: [f2fs-dev] [PATCH v3] common/encrypt: Explicitly set the test
 file to uncompressed
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 10/6/25 17:58, Jan Prusakowski wrote:
> verify_ciphertext_for_encryption_policy() checks if encryption works
> correctly by reading encrypted file's contents directly from a block device and
> comparing it to a known good ciphertext.
> 
> This, however, won't work if the test file is also compressed. So this patch
> adds a check if a test file is compressed and disables its compression in this
> case.
> 
> Signed-off-by: Jan Prusakowski <jprusakowski@google.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
