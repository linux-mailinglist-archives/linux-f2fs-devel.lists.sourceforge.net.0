Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A66CBC35B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Dec 2025 02:49:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j9PGMUL3FtsHinOJmiXJeGoiB4VmorzmZmHe064BVEY=; b=M8lqLZLcUTqOUjnzqIOmkCWz9E
	VbbH3qE9548ESpRlFz3zZZX0t1nxHEEwKaxIjrR/vFdalhhBUTuW8gHIkWXITEG9F4t6GEw7IlUsI
	FbLxmBf7VTQBWIRVdjZHv4TjCyGgomVPPE5jMho6dJU52ZMJZ9BENProZ0ownU8wXHG8=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vUxiP-0000wy-A5;
	Mon, 15 Dec 2025 01:49:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vUxiO-0000ws-Ci
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Dec 2025 01:49:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RtlE7gYswQrAivJ+fzLxcWlzWdJdy50xulFS8XVcF98=; b=khVsldxaMO7jg7CY9wVeBREHWZ
 8h2cdQk+xkQhxL3uRODWjOC1xU0EtxgKZZbNtlEpj+WhUhRpuI5lN7xE3xucD8WMu++A3BbVcEwiT
 5UUzrcluBbK4BTGBkp/oxR/e5xVu7Ywj1MxOTuLUrngaBJhD4FWb+IdisospSSJ9KeuA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RtlE7gYswQrAivJ+fzLxcWlzWdJdy50xulFS8XVcF98=; b=Fd0xxbpMpOeKjzUSEDtUFOeOIl
 QJEgmUdBQ9bFDxDVTLzyamd/ufICbZgcLNXVuj/dXz/+k5QMJvzP+s2eKx0odiPaLyLHwJ1imdL2b
 i0st4m4xf7hnCJ8lw51uZ/cFnMnbIVX7bsIaktvd6rr2gswHMr2MDWkGABz43xz74p2Y=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vUxiO-0006Tw-KP for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Dec 2025 01:49:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 18B3A40160
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 15 Dec 2025 01:49:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E8A8C4CEF1;
 Mon, 15 Dec 2025 01:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765763362;
 bh=RtlE7gYswQrAivJ+fzLxcWlzWdJdy50xulFS8XVcF98=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=BCLsFu9LKjKioZOVi0KEbpk1FUYCwEQ3pL2HIkbA/uJyxZoh2TkICC+STh5HHxhTi
 RSYg3o3SbngixwkbZjTbtakGuu8REYd61Ve4d79mO/E+EBqe8lMs22c+5tF1BpS0YS
 14yQDGO3XZg28bdeBAI6HT5T3acZq9ntnecHA2kv1GKFEbUWNcWjyMHZNovERcJHWx
 ibwQGq1QV5HZgEga94mhhy/S9UI2GUpGa8J5eJPsW75LmFgXEcY6IZ0bpwbqltfXz3
 o/DRVlW6Ao44ClkNnRaRYRFC6JeV42alsB5ZPzbrkFzkx7+lNnxrtDJHDobalkGirb
 pmc+oEoWO75Kw==
Message-ID: <8eff7750-9d11-4541-9272-1be9dd5196e3@kernel.org>
Date: Mon, 15 Dec 2025 09:49:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
References: <20251212005545.3912333-1-jaegeuk@kernel.org>
 <20251212005545.3912333-2-jaegeuk@kernel.org>
Content-Language: en-US
In-Reply-To: <20251212005545.3912333-2-jaegeuk@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/12/25 08:55, Jaegeuk Kim via Linux-f2fs-devel wrote:
 > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> Reviewed-by: Chao Yu
 <chao@kernel.org> Thanks, 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vUxiO-0006Tw-KP
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs_io: add more description in read
 test
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 12/12/25 08:55, Jaegeuk Kim via Linux-f2fs-devel wrote:
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
