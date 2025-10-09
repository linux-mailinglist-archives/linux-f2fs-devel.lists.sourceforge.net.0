Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8CFBC738F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 09 Oct 2025 04:38:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8OueoP6y1hZjvvRSx3IbPG0Dk24X4DpsKd60HmBLhjU=; b=VRc3XMQYPMAkmFd2mpq9EK3pAF
	9b7O1kdXBvJUeOy9jh+jcJ0m2P0nTnGQX183szl9hSjebXGFgt295MXfiTyW2VACNSX9nGa0YrujS
	XHTWe/UVOpi2A47WdDSv4vZqFbUGhA4Z0tcd5UIQpIs9iSrxskbPz/kXAF9Uz1o4tbNk=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v6gYA-00052D-8U;
	Thu, 09 Oct 2025 02:38:38 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1v6gY9-000526-HR
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 09 Oct 2025 02:38:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fGMfFmoFd/Cwxq+I+ynLOyxP7u2bkoynq3rfhdhiLQU=; b=m4MSmVfMb90RA/NEGR38+BXOyI
 A9gqU+8orfN5rtLkKn8mgM0lLP9Ew+tgKJxhCk/g5WGOQX8QiQ/gkWK+FT03jbCyp2shG5P+Bge89
 VQL0WyCh0ZhC80d4jx1JbrfQHwiIpIXkdNlm4YzIopud/EyL49LmK2Bw2kpL+w+2aaPM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fGMfFmoFd/Cwxq+I+ynLOyxP7u2bkoynq3rfhdhiLQU=; b=LyCUidt/7O24IhMNTg6VlUyzvJ
 KcZbq2Rg1MN+KErczO381Kd1KBthLLtN3QRitD1avKuCl+HVcFppVrevYANzwvEL+Hk335So6QEGA
 2HRJXpI0SHhC2eRLE7Yv55dNuH09XLBodl1AgtX0XvxJIEaxzLlJ+4cqFEoMzu9al/So=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v6gY9-0003zf-5l for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 09 Oct 2025 02:38:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6F3876215F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  9 Oct 2025 02:38:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 113E9C4CEE7;
 Thu,  9 Oct 2025 02:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759977511;
 bh=xtryPvXrhVoDVkc0yZB6xXoraMWeWn5xH5XMtmpzmNA=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=ERkFIgafDeZejPtIJ0LPmpZoDDvnqKCYAYMA3Ni6A/lGB5ZBpiDoXIDOlqZ6vwdRg
 Rnaut2ugoBL7d/xAE2W/22hkq89WU8yxpm5HAVdDkUlqrUs7oLvz1d/nK18gATiwVd
 4h61SwHvlpxPKkdzhCnw3E7ZfUrRorSuEFpjEpcXL3aksW/OVN8LxYfdecDVDJWuCq
 aSutKAnS/OSqr7OvBR8wG8drDK02D7zAiVXwJgRB/Q6WK29wtPldgaVxayRz0abt1/
 9VHHOIBdgj/sqDgADsyGcBFndgq7KnujmOvrltJIPeJ0OddpLijhjXJ6tiqXxBHKVe
 if2ZiWjjhX3UQ==
Message-ID: <4fbbc585-d6c4-497a-a9b8-516db8987d9c@kernel.org>
Date: Thu, 9 Oct 2025 10:38:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
References: <20250930023704.3019074-1-jaegeuk@kernel.org>
 <20250930023704.3019074-2-jaegeuk@kernel.org>
Content-Language: en-US
In-Reply-To: <20250930023704.3019074-2-jaegeuk@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 9/30/2025 10:37 AM,
 Jaegeuk Kim via Linux-f2fs-devel wrote:
 > If we give a negative offset, let's do random writes. > >> f2fs_io write
 1 -400 10 rand atomic_commit ./test > > conducts 10 random wri [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v6gY9-0003zf-5l
Subject: Re: [f2fs-dev] [PATCH 2/5] f2fs_io: measure atomic operation
 latency with random write
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

On 9/30/2025 10:37 AM, Jaegeuk Kim via Linux-f2fs-devel wrote:
> If we give a negative offset, let's do random writes.
> 
>> f2fs_io write 1 -400 10 rand atomic_commit ./test
> 
> conducts 10 random writes by picking addresses between 0 and
> 400 * 4KB.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
