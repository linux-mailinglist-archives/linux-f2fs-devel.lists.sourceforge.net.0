Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4CEAAF3C9
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  8 May 2025 08:35:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IXHUfa52ho/DU36/aVUwaq3V+NsSepPTOi2q9cWbKtI=; b=MDnOpZ5f1sLCfBNkFu+mQrhnxA
	bGFYWCFrHaK1fMAuW9Xrn/98hFnWM1WPJyOc81TLs4H/gdB9LZ9SC9ywsmIOVkyS2AEuoNOAODvfE
	3x1mompGPio7yB5HQSc6BGnugKvdbSLM03DifgcalJaHhh4+NLfkdpFEK73VX80IS7EY=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uCuqZ-0008W2-Gy;
	Thu, 08 May 2025 06:35:07 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uCuqX-0008Vs-Hi
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 May 2025 06:35:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=17Gwc1cD5LchZj7cFYmX+5TMzLVpP/m/2RS/2schTbU=; b=b/RN+KF5ceokMsGhNyoVJ9zlGT
 +MkoGz4LJ5Kd7QmIXE4fM/rE1bewZWuLgqPZyhu7UNOkcV4m7swa1U4Ndk/xWjILSV0uCk5nQY2Ag
 zd+z+p8dBtjycAh6lQbSg7QDweCXuKg28qxelBPQZfpuqBKaEwlpSOiGjQgVrcJKXY1E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=17Gwc1cD5LchZj7cFYmX+5TMzLVpP/m/2RS/2schTbU=; b=YPaZkFEOwmifRvwcz+9NuWlhOi
 YcuGnS/bG0SiTjgl31fcaNAar8rgCL+JmYnnQKbZ87XPfs9yDgpqSEAGTuLv2A+I1HDr1F7v6cY5a
 dpHIeAtvReNjOEkGw3WR0jeKhU8eDAzqj0JlWhVgh6yQbMDgEIgYxXoxYJesPNfPlcZc=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uCuqX-0006x1-0S for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 May 2025 06:35:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4AE4660010;
 Thu,  8 May 2025 06:34:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4621C4CEEB;
 Thu,  8 May 2025 06:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746686099;
 bh=iRUqwdtVluzi8HRIkzz+g95ssxWFsQLhfah1v85A2gU=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=N3jeWaYdPn2Ex2T0rif9mSaRmPvo2z1LdpQBRDqVCadN/i3AzRTT+t7Egj7q5V9Aj
 uT7JEjFv2rgeWY1vuxvSiGNDcG28yDTXcG3Uq7HsXuAFWFx/X/yjebYxt1ge10gPHY
 J9kXsDjYWpn5meyuB+zC0zHZQJS/lSz3e+lekwZ69Pqzw8kY5FdbeTLJIgzhxq1M1a
 9g3fJYQbIQ77mREBBg/hWrTJ2l1+WXufOw9fG7VsVCFy6TiDpPNKp1EsJOXUq68Rlj
 8tSJ6BG5OzVTB36wpAOXJEuyN2LOuz0a7z4Yi0Lg5Pdj/pakt0R+RAMKrzn0MuVyQz
 14YDPtm+f96Tw==
Message-ID: <b4ec3021-9786-4712-b66c-0ec78b852e6c@kernel.org>
Date: Thu, 8 May 2025 14:34:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Eric Sandeen <sandeen@redhat.com>, linux-f2fs-devel@lists.sourceforge.net
References: <20250423170926.76007-1-sandeen@redhat.com>
 <20250423170926.76007-5-sandeen@redhat.com>
Content-Language: en-US
In-Reply-To: <20250423170926.76007-5-sandeen@redhat.com>
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam detection software, running on the system "6901ab67b84d", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/24/25 01:08,
 Eric Sandeen wrote: > From: Hongbo Li <lihongbo22@huawei.com>
 > > At the parsing phase of mouont in the new mount api, options > value
 will be recorded with the context, and then it [...] 
 Content analysis details:   (-1.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uCuqX-0006x1-0S
Subject: Re: [f2fs-dev] [PATCH V3 4/7] f2fs: Add f2fs_fs_context to record
 the mount options
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
Cc: linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, lihongbo22@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 4/24/25 01:08, Eric Sandeen wrote:
> From: Hongbo Li <lihongbo22@huawei.com>
> 
> At the parsing phase of mouont in the new mount api, options
> value will be recorded with the context, and then it will be
> used in fill_super and other helpers.
> 
> Note that, this is a temporary status, we want remove the sb
> and sbi usages in handle_mount_opt. So here the f2fs_fs_context
> only records the mount options, it will be copied in sb/sbi in
> later process. (At this point in the series, mount options are
> temporarily not set during mount.)
> 
> Signed-off-by: Hongbo Li <lihongbo22@huawei.com>
> [sandeen: forward port, minor fixes and updates]
> Signed-off-by: Eric Sandeen <sandeen@redhat.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
