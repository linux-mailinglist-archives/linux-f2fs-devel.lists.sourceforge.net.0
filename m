Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C3EC9C89B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 02 Dec 2025 19:08:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5yb9LM7Vln3ZHOVkAwopkLFdqA9rcHPrXKY7c4PrSqs=; b=Adkpe6Ufv3ZlnxVtIPSbpwcudP
	9MlazBbHHosM6th0QFcpzmTfA84QwDtDqUFY1OMDmatTn1IcoqSB5zGCwuxlLm+Jd0gw1K3sJ4dhP
	BldJPZ1WEwBRyI1bsqdAbZx3/Pi4PFwCGG+H5tVv6yvTId62SzE1SX/APDtrth3nmv18=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vQUnF-0000QM-Gd;
	Tue, 02 Dec 2025 18:08:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vQUnD-0000Q6-KY
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 02 Dec 2025 18:08:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IGRnLYWX5yXFPTyqJxiH5xzhTS9Ik0bKJQKVF6CnXI0=; b=dPPBLa/Rt41R9Klqx9gud1GaoH
 HW96TR79tf812hMC6Pc22cEljRcABoPCdovodE/xSMJIP9ucNZzCyM0WyUCEV0AvUMXUVtOE/zwqK
 j/+I3/QkvWmOTO2sKqpgszx2MHy5thKu4VE8YiG0EGX4wR63JZhPImp38+5fzzBHjgW0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IGRnLYWX5yXFPTyqJxiH5xzhTS9Ik0bKJQKVF6CnXI0=; b=GVeDfx/bB1z49QK1qwKMUMIaNi
 XWFv3/xKR1j4NVJbVs1PXIjJvgMtMq8nU1FsA4RQZl5TJgHjURBbfUApNTm/O1wqaw3dVPMxrm4+p
 Uo9cyC82BZjLWrD4BLeQpsza2feIQcojm+z35BmVvFIqDIfZIVKk9KIenMuArhJQE3Uw=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vQUnD-0005Lh-RA for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 02 Dec 2025 18:08:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 816CD43AA7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  2 Dec 2025 18:07:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8192C116D0;
 Tue,  2 Dec 2025 18:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764698873;
 bh=lNMThDcnBs33yUKf9ipOCpdmS/d1fCekztUjy0LIXHo=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=kKLJrHnb9XDzygJeHgCdudXHPqiwCrTzWtqlL5mIjlbLjeOwge8MvwnfwI2IY4DGk
 DUY08VqRVUaVeHrJNv2WABHBAN71GuDChotxOIsa/fMdPdFdnuj6reuHqjCzLxmlN4
 PY3EBr2wgceoiaZyRxLs6VakjcKza11VQo38DU4/IUb9WlQY+3OlEd/qGSd/oY2s79
 IwiKP83rOSwOn0r06DRZDAbHDbkRtJ5vnEcA5VskYyslNyikFOnAT2EefJd0MMbbpK
 uMbWSRaJ0Qhwt4Oikrnd/bGlKeDZY4/e6dlMGSZ1cdZCnXPyn3fp6sPpJJx59MFVVp
 GlCnz4SPvuGHg==
Message-ID: <97ecd003-e3bf-4112-80e5-d2db31484471@kernel.org>
Date: Tue, 2 Dec 2025 10:07:51 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20251120235446.1947532-1-jaegeuk@kernel.org>
 <0153ff69-789d-4fe1-a89c-0c607a9a7d6c@kernel.org>
 <aS3s98fgy80_xDuK@google.com> <aS4W7NBYFPwP6KEQ@google.com>
 <aS5RG6IQ8AlXrLwT@google.com>
Content-Language: en-US
In-Reply-To: <aS5RG6IQ8AlXrLwT@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025/12/2 10:38, Jaegeuk Kim wrote: > This patch enables
 large folio for limited case where we can get the high-order > memory
 allocation.
 It supports the encrypted and fsverity files, which are > [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vQUnD-0005Lh-RA
Subject: Re: [f2fs-dev] [PATCH 1/2 v4] f2fs: support large folio for
 immutable non-compressed case
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2025/12/2 10:38, Jaegeuk Kim wrote:
> This patch enables large folio for limited case where we can get the high-order
> memory allocation. It supports the encrypted and fsverity files, which are
> essential for Android environment.
> 
> How to test:
> - dd if=/dev/zero of=/mnt/test/test bs=1G count=4
> - f2fs_io setflags immutable /mnt/test/test
> - echo 3 > /proc/sys/vm/drop_caches
>   : to reload inode with large folio
> - f2fs_io read 32 0 1024 mmap 0 0 /mnt/test/test
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
