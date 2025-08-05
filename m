Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 37435B1AF04
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 Aug 2025 09:00:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uyPi6Fwpi2TEPtR/3wHtWq6DCWystHN5J9byMd9i4Mg=; b=Y/TPJCMmfp/Gxlea3Frqw0th/B
	P3/cZsyALlXoOJykoVCNldUSd6CCHlXq5zYF3rmXMA+Cw92ZCxKXMsvC9WkSPgnE6UUOK1fEfDVdx
	RDwMArbad3YHStXRVJeWdUGloN60JjWGRVJUGWS3iWiO4lnpuHLdeajk2aPXjMv/EB70=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ujBeo-0000AU-GZ;
	Tue, 05 Aug 2025 07:00:22 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ujBem-0000AJ-Lv
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Aug 2025 07:00:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=a6dNFvp+Ouf/SJ+w7pIGZp+uZGArECGS40cogXtkQmI=; b=DWpPObAnUpEQzciRnrtmAZ7uLh
 pjBOaIt6AEiAW+tHe+YhuCfJ4LH1qDMZ+lPaJusnFr6iI8gLdm4bzb59WM5gaBm8IY6E1DEmQZLss
 i/soNKsscDVZHS42JFtE4piWpPY971fKOpiDeMQI45YBivKX0Y9juQQ7jpI66u6aa6j4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=a6dNFvp+Ouf/SJ+w7pIGZp+uZGArECGS40cogXtkQmI=; b=PUAoNHR8QHNtdFsr9wU1VUemqk
 i4NWGdxovSh5uLNrJOEkOpoxpZHr0+u4lOIKp1TjMzYxdnBaig5qpJq26s4q5cCPIel3Rd9BoE4nj
 xBnsKcENxJJcm60t25JcmmHAdl8VRe1aPFhN/p3lqLG9j6nCPqN/JAKS3b36ePYGsd8g=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ujBel-0005HE-UK for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Aug 2025 07:00:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6A73D45824;
 Tue,  5 Aug 2025 07:00:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32362C4CEF4;
 Tue,  5 Aug 2025 07:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754377214;
 bh=4ttDSFoTx2hEl3kQCulPLEVxdkGEo49ul/k3VtCKPdo=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=qXREu/I1hvHigY8V14E4v9Ut5lyuWMf6F1ei6LsBSG+4XNrZP2UanPXf9hMwU0VKa
 biI4QrITK5119USxzyldbvIi/KJ3MCAR/bZc0NzOW/h1KR2HCtXuaR/fU11xSvyqGt
 BAnBSKLvPmK17tCsdYs0SNQ3ET/yg/SqXx346igfPUFPnmngQ5sXtVONET9OybqaGM
 2nMzmw7ZBIwpSTd14XGRuMacQfrq273ap4O+sw0gGcipsN445yDrVNStPMRUEI4uNN
 ZzsmNyfCD5pAXgoEiPPiKGP3az8FQop4EArJnZ2aeImMRRt9LhFYFxLGqpmwtDDP3Q
 yueK/4+Z4tm8Q==
Message-ID: <cef0e7f2-9136-4854-af7c-2b0956f1e2b9@kernel.org>
Date: Tue, 5 Aug 2025 15:00:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daniel Lee <chullee@google.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20250805065228.1473089-1-chullee@google.com>
 <20250805065228.1473089-2-chullee@google.com>
Content-Language: en-US
In-Reply-To: <20250805065228.1473089-2-chullee@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 8/5/25 14:52, Daniel Lee wrote: > This commit introduces
 a new read-only sysfs entry at > /sys/fs/f2fs/<device>/effective_lookup_mode.
 > > This entry displays the actual directory lookup mode F2FS [...] 
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
X-Headers-End: 1ujBel-0005HE-UK
Subject: Re: [f2fs-dev] [PATCH v3 2/2] f2fs: add sysfs entry for effective
 lookup mode
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 8/5/25 14:52, Daniel Lee wrote:
> This commit introduces a new read-only sysfs entry at
> /sys/fs/f2fs/<device>/effective_lookup_mode.
> 
> This entry displays the actual directory lookup mode F2FS is
> currently using. This is needed for debugging and verification,
> as the behavior is determined by both on-disk flags and mount
> options.
> 
> Signed-off-by: Daniel Lee <chullee@google.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
