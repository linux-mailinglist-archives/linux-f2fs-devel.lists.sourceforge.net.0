Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C405CF114B
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 04 Jan 2026 15:43:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MxWPUasDQIYrQ6qlVu9W14iOfDulWf19vySPP9miysk=; b=ARXEL4Rwz0bho9i4vY7yhNBjsP
	TR4Mp2FrrELAk7f67ynCZ5xbsHB+yLOb/5U7Db4zc5crd0VpeCz6vr+HXdbls39yql5blEC/1BzS0
	nK64T93J2kjo/lLiarnoQmDqGmgFHAaJxuITpJzxcMubdrgcoYVvr9IY76FWeMlNEkVk=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vcPJu-0007rM-0i;
	Sun, 04 Jan 2026 14:43:02 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vcPJs-0007r8-SK
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 04 Jan 2026 14:43:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uVIKbVYzFKg2S8GrojwNYloOIfjJ0MHKT+XSYrosZc4=; b=bZZcIbMkfNla30TwnQzP5tFKCk
 H++9HnMbJOSOnZhTvT5Hv7KKBwFpcCaT4xK00uJTEFb/EKB+0aJGHKqfIP+4IZyQ9jHxDYQhDvk9C
 SSw6VbNX8SLsfVdBBG6c31ccrX8uD04Umwhi9Kz5DgSrJopGyD+oVLrdon13wO6FPcEY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uVIKbVYzFKg2S8GrojwNYloOIfjJ0MHKT+XSYrosZc4=; b=LokznM8TXF/uW8Wiriofq4lRsh
 MmaGaGAKsMe3U9zEl1VJh3sJQozgYSpPptHLWqKc/DHIDe1UOUTn2EDfa0RS0/wqk18O9S5GQcy/c
 XUUzwvfuBNF9J74tGSu+uRw7RAFXkdsn5lekyTk58aml4rDj7bJLrqXnG7tdjedDAbSw=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vcPJt-0001tt-6D for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 04 Jan 2026 14:43:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C751543AA7;
 Sun,  4 Jan 2026 14:42:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F4BAC4CEF7;
 Sun,  4 Jan 2026 14:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767537770;
 bh=qLh7a2fNEbatp51SHeXp1DxBMO4onwIeinZHCMPacSY=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=KqzerijvOqYgGRe9eC4ccQ/LSA5ayJm0QlP+gcpnScS0uf4rWnqsOcGbIzWVG65BM
 xIa59gy2aFExXvSwaOfVO1u5gaamgOgmym6qWn8pQM3HMVoIK6T86d8zAOHl2ro6YC
 7mW6WPxPKAQYVsdPd8u4RgCnWoFX6bE5OKsoQPYuZtw7cyz1ssfFxus5VLY0RfkUPi
 2Kc1XJyRchgnBuZPv/2n3J0uvaQOSIrZJR8FqXWIOTFxwtTNNl9gI3YU7BuxR67wGR
 CigyXPmH5U6jAzEupdvy/3vIvS8O5cMhGfTh7RzSe7uy/8BqcnNGFIBzgrD85/XlBw
 d1Y60CvpVlD/w==
Message-ID: <5b348fba-6b32-420b-a0ff-65c5d368d1a1@kernel.org>
Date: Sun, 4 Jan 2026 22:42:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Joanne Chang <joannechien@google.com>, Zorro Lang <zlang@kernel.org>,
 fstests@vger.kernel.org
References: <20251229023145.1806877-1-joannechien@google.com>
Content-Language: en-US
In-Reply-To: <20251229023145.1806877-1-joannechien@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/29/2025 10:31 AM, Joanne Chang wrote: > generic/735
 attempts to create a file with nearly 2^32 blocks. However, > some filesystems
 have a maximum file block limit below this threshold. > For ins [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vcPJt-0001tt-6D
Subject: Re: [f2fs-dev] [PATCH v2] common/rc: add _require_blocks_in_file
 helper
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
Cc: Christoph Hellwig <hch@infradead.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 12/29/2025 10:31 AM, Joanne Chang wrote:
> generic/735 attempts to create a file with nearly 2^32 blocks. However,
> some filesystems have a maximum file block limit below this threshold.
> For instance, F2FS is limited to approximately 2^30 blocks due to the
> capacity of the inode. So add _require_blocks_in_file helper to skip the
> test in such cases.
> 
> Signed-off-by: Joanne Chang <joannechien@google.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
