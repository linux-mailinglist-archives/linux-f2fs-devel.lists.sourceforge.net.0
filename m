Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 32371BB5BCB
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 03 Oct 2025 03:27:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i11eHrrziLcUU7XAAvgwYlj/gToPyTIfRZbM4FbJ4v0=; b=V5xcEKHq7vfhEwhKbzY299BRsY
	ahy1CrNx4z4A3KB6pV65i9E4Y+Y5zGiAwK3a9Smw13M/rrddBkplF2qpJxGS3ZFIqD1+dCbtAbajx
	MdJHHLWcbeLlBE4CQQjFfnzOGv0W8+OiaX0UtgOnvGOiOYl48GPiKzrEi/03LsGWEj9Q=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v4UaF-0001Wc-FM;
	Fri, 03 Oct 2025 01:27:43 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1v4UaD-0001WU-T4
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 03 Oct 2025 01:27:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KjoYhlRCJ8FKZJhE1JIi4rm0d/AseUKY2RxpqNRpXNI=; b=NAMjvYxLr1U6r6EfQHNYbBEPo4
 1QFDNRM5m1Qu/8lFA4nJBSFZ1/FI3uyUZ1tpenlFlrXTo9arJu5h1gpDiZ1KrZytfJWEEs6Rp2eHS
 FfLAKYHxvvuBz6gZUcg5uddmtRNg+LFFHmcQqv2lL50tnOkx1czh/9nIjFWdt59Gyh90=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KjoYhlRCJ8FKZJhE1JIi4rm0d/AseUKY2RxpqNRpXNI=; b=j2KThMdzle43nR5zzzy2Ao/Yff
 T1ayZ4vxq/Mpfu2CmvhP09ibO5jha6O/uoJ69hD4s3fIMSyeKAeBC4p+8+2uo9hZ3s029DUjbmcBQ
 h1+fsRIyyCM0b/ApNM/HwDV/eKg8HFqbU0qoBn7mAv/xUkaEcku4ZHVZCPfAoqr9YF0U=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v4UaD-0004rn-G5 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 03 Oct 2025 01:27:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id CB3E6601AE
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  3 Oct 2025 01:27:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40B4FC4CEF4;
 Fri,  3 Oct 2025 01:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759454854;
 bh=7VsGLTYzGHWM+abr1cFG7wV/s7mUQcTViJnAxj7363c=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=ZwkrTOKw55Oiv0Pct7iJyoxUY+J+zrCh2ofOK23EiZP9OB4VM+9OkmTh3sFodue1k
 rU2XIXgX+P8W6GDYh6FN/QRBgyAO9AzrBZ6QlQp0+Q78LiejQ5tdJRdhvyn7LFZU5h
 NbQ2Xs6w9VttAhLQPlo/OuY9B7QThsqIVQMROWqgoii5YibKNsnC/N67JcBuyfk37s
 Sy5L0O9sdBexVz5aYIUeZrmhmjEAWmoVIrKyPYFXO9zBwW9iPtlVpwxx66HdruSiBY
 u6ddSMMJ7EVoQOa1a3qsWDO/0JziSWru6tw8pAEmiklQphxoHrCEQnbxAlnuvo7UzM
 Ut4nkQ+PJxQ9A==
Message-ID: <cca96baf-6e97-473b-b77a-9ddc28060f4a@kernel.org>
Date: Fri, 3 Oct 2025 09:27:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20251002015645.3588322-1-jaegeuk@kernel.org>
Content-Language: en-US
In-Reply-To: <20251002015645.3588322-1-jaegeuk@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025/10/2 09:56, Jaegeuk Kim via Linux-f2fs-devel wrote:
 > We missed to call dput() on the grabbed dentry. > > Fixes: f1a49c1b112b
 ("f2fs: show the list of donation files") > Signed-off-by: Jaegeuk [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v4UaD-0004rn-G5
Subject: Re: [f2fs-dev] [PATCH] f2fs: add missing dput() when printing the
 donation list
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2025/10/2 09:56, Jaegeuk Kim via Linux-f2fs-devel wrote:
> We missed to call dput() on the grabbed dentry.
> 
> Fixes: f1a49c1b112b ("f2fs: show the list of donation files")
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
