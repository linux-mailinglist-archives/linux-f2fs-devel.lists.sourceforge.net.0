Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A12C82FC4
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Nov 2025 02:10:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mnQwVcJoPWeQDxfuRgV5qUJZZKs/kBVcAXyMXJKWZXM=; b=M7cZG7MkO35GtF988myvT1qwGc
	M+pCgQeEvMkfmIlsRtXk8HdZQ4l5kTqOvQYd6cljoe9wKwDqu7mIp3aGq1GFaD4UgSSmgidJ1PVSY
	SycBWCVhfywLgmV8qxdlz/99DM9Pa8FAWH4Njgo1iENycgGzgGYUPRvt7+ZKRyWhtCmA=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vNhZK-0007bM-Uc;
	Tue, 25 Nov 2025 01:10:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vNhZJ-0007b8-EE
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Nov 2025 01:10:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ry5dUxWKQuIvU0Z9oz0DQh9+43tGYessbm7lpwjbNgE=; b=bvABHX9CIyMzf6895Yu9zfET3Q
 IiPwxa+UPF1HjO5MV8q7Wjhzp7gD57e1Tu6ulptR1Eb7WCD6lzINiSZtKtMOuCceI5Axo4mhS88wm
 rxXKmLJ/ZmsCFqgMp4HpBgyvE7legHIdFKAS8l4TOOihMYZWFarbVRFaHk+o9uAJVZKo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ry5dUxWKQuIvU0Z9oz0DQh9+43tGYessbm7lpwjbNgE=; b=jipTh7GA0efKRTXiwcE1CurP9m
 K7XyeiXIKT7l+xpRzKrMmXekwvuBvXkey7cWOmFQKUSkInXnjGujOXkQUMIMtzn4QC5EpfkPjGnxi
 2oaSbS1Tmrf+YnKNwGDq/rMm0OTCXmUTDa8ftktul8h6EhUhSXzdASQnJx1KTPcCkVKc=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vNhZJ-0001TX-Jc for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Nov 2025 01:10:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9B25260010;
 Tue, 25 Nov 2025 01:09:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A996EC4CEF1;
 Tue, 25 Nov 2025 01:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764032998;
 bh=p+RQE8h6QFhjvlBxPivIpSfBdKHxPiCLXqbTGtWf46M=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=kQJwBRIeltEvdGX/fAzab87jUDhTkk9++PHTM3qoEmNCswD5CsY5f1W7YtjrR/vUq
 LnALvZVuJEgGzptHvE6j3cCAhVedGqzRCrYyf1Fu00EXD6d6rEfAz9S+2YXLZBAQtJ
 HxEQgduuPzo3Dd+9t3obcRy/Orvao8Wxj81DLFib2yxL6imPcs0CmgyKSODJ+S1VHT
 CSCwwIQ5J/04Sxuq09AA5BVjAA/u3mNTjQ8XH4pJIhkIh/la8Ku+qYTUYAT/pLiICH
 QJi87G1lUUrrxvn8l9VYu75SCwr+C+d3qno/7HTOSdpLH0GK1OOjpnIjQmZ4x+gudR
 oNNSBkRlqrvOg==
Message-ID: <9c8a6b5f-74c8-4e9f-ae46-24e1df5fe4e0@kernel.org>
Date: Tue, 25 Nov 2025 09:10:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chaitanya Kulkarni <ckulkarnilinux@gmail.com>, axboe@kernel.dk,
 agk@redhat.com, snitzer@kernel.org, mpatocka@redhat.com, song@kernel.org,
 yukuai@fnnas.com, hch@lst.de, sagi@grimberg.me, kch@nvidia.com,
 jaegeuk@kernel.org, cem@kernel.org
References: <20251124234806.75216-1-ckulkarnilinux@gmail.com>
 <20251124234806.75216-6-ckulkarnilinux@gmail.com>
Content-Language: en-US
In-Reply-To: <20251124234806.75216-6-ckulkarnilinux@gmail.com>
X-Spam-Score: 0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/25/2025 7:48 AM,
 Chaitanya Kulkarni wrote: > __blkdev_issue_discard()
 always returns 0, making the error assignment > in __submit_discard_cmd()
 dead code. > > Initialize err to 0 and remove the [...] 
 Content analysis details:   (0.7 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.0 RCVD_IN_UCE2           RBL: IP Subnet Listed in UCEPROTECT Level 2
 [172.105.4.254 listed in dnsbl-2.uceprotect.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vNhZJ-0001TX-Jc
Subject: Re: [f2fs-dev] [PATCH V3 5/6] f2fs: ignore discard return value
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
Cc: dm-devel@lists.linux.dev, linux-raid@vger.kernel.org,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, bpf@vger.kernel.org, linux-xfs@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 11/25/2025 7:48 AM, Chaitanya Kulkarni wrote:
> __blkdev_issue_discard() always returns 0, making the error assignment
> in __submit_discard_cmd() dead code.
> 
> Initialize err to 0 and remove the error assignment from the
> __blkdev_issue_discard() call to err. Move fault injection code into
> already present if branch where err is set to -EIO.
> 
> This preserves the fault injection behavior while removing dead error
> handling.
> 
> Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
> Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Chaitanya Kulkarni <ckulkarnilinux@gmail.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
