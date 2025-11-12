Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9126FC51D3E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Nov 2025 12:05:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Lz+uB/oSreeOUQMyXGsIfiDADZDJKeKakDnp7aViEc=; b=heYZSRE58fzYpC3XGh50KCa8E4
	NbXC19ZRhjOTAQCojXJxENwO7YpCbdMDcilWW+++2bJDdjgotAquSoXRMvkfG8cpHMvoz7YceN0By
	iCutawDg7SZEucot3fRGQ/bu+6UC7PYMqSTVksd5iY27He6Co3ZUqscpyUmEuWuj3DvI=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vJ8fH-0006ge-AR;
	Wed, 12 Nov 2025 11:05:27 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vJ8fF-0006gY-8y
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Nov 2025 11:05:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wbFr2jDQ668WdzewYn8BdMjqCI6fsv2DCukv7kuqUko=; b=Y97KGC/ZxK+7Mh5+aVPzxI5Qk6
 ECZ3JHGeBfDAZLNKxir3ix1CSMUufjZtwwoM/pUK6eTSoGClAatDwpF4VgmIuTjU6FYdzJnJVTJA9
 rE5e/Y5sAm/tl0Tl6IAGejngz7UodT8uG3ksZlHrVYXhH33g01oKd+11VTUvKLkArQKA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wbFr2jDQ668WdzewYn8BdMjqCI6fsv2DCukv7kuqUko=; b=eeucE6cI96z3OfSPsX5FISfeVb
 nfLTUvv2Q/4OUM1VbCsEW8pyNWg2GICQXsjdJ636wEyaPb6SMuhpNuARB7OapfQQbEJsd8yT028w0
 mC0iKF8mAwr4nabFhBRscsfyRUHwR218OKJwfKmakJ0OAx9+3svR2AMcRYS/oTGaCP1I=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vJ8fE-0006ws-Sx for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Nov 2025 11:05:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 70E5241B36;
 Wed, 12 Nov 2025 11:05:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98869C2BC87;
 Wed, 12 Nov 2025 11:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762945519;
 bh=fnS4LISb2dhDNc+2Ow0QDW5zzREQHSOPCznPZPdpVF4=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=fqgF11jDdwQ8KCNfgMb8djvlLjXSlnCdHezEVVl+SORs0W6RcAkuW8ycDmAms8utd
 5wcwyxn60gpP/IpmfgqYLnpVL0Zw/ug+tcKmk0x5kWUt3+Wm0wSYC6Mv0wBBQ9GoZC
 8TOQqu6csF78ZVeJdMF8hBHCvfK2DM0hpos4Z38M5+nZ3Qx6Ne9WVvtJ2T+pe4kEtD
 X2NM2mMvKaZuzVWq7sYCQei6H4hbTQNIUovUenT4NfrEKGxA/k0cjXPO3+XHw/3Uh3
 aZJ8t8Gr/EY19OTOX431jMip/nNeCpZWLZQ6Pnpt6gvblrUl3AgHJiQAVOTcT9KhvT
 rLIBlbUtRND4g==
Message-ID: <bea78bf3-ee75-431e-b65b-1525d26f6589@kernel.org>
Date: Wed, 12 Nov 2025 19:05:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Baolin Liu <liubaolin12138@163.com>, jaegeuk@kernel.org
References: <20251111121728.29433-1-liubaolin12138@163.com>
Content-Language: en-US
In-Reply-To: <20251111121728.29433-1-liubaolin12138@163.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/11/25 20:17,
 Baolin Liu wrote: > From: Baolin Liu <liubaolin@kylinos.cn>
 > > In f2fs_recover_fsync_data(),use LIST_HEAD() to declare and > initialize
 the list_head in one step instead of using > [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vJ8fE-0006ws-Sx
Subject: Re: [f2fs-dev] [PATCH v1] f2fs: simplify list initialization in
 f2fs_recover_fsync_data()
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
Cc: linux-kernel@vger.kernel.org, Baolin Liu <liubaolin@kylinos.cn>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 11/11/25 20:17, Baolin Liu wrote:
> From: Baolin Liu <liubaolin@kylinos.cn>
> 
> In f2fs_recover_fsync_data(),use LIST_HEAD() to declare and
> initialize the list_head in one step instead of using
> INIT_LIST_HEAD() separately.
> 
> No functional change.
> 
> Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
