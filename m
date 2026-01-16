Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE3FD2E51F
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 16 Jan 2026 09:54:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MB5kA8IlLFF2IBtG342IV+Nu3wS2rDbcTd0LBuedyeg=; b=G26BK6FGl/EUKZE0beyhNzEapP
	wvgBkXJ9g4VYqGM0CrQ0Lv9CaF0gAWv1dtuT7jYyb7ah720ZZ8mgH+n7bCVnQGIq3RrCy//l7d1gM
	NaPuWIu288s5A4QCcMJvkVcoz91USA9L04BGcRJOA1dwkzKb1aIqB0cT1cV6O8Ym+ZSc=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vgfbW-0008O8-HO;
	Fri, 16 Jan 2026 08:54:50 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vgfaO-0007yv-Rh
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 16 Jan 2026 08:53:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FjNHaBd8/hOFw5UP0yM788NJkfXYhJ1t/Q1rivxWvDM=; b=ZwmgiHWXKBJMOzYeg4ag7K5EIW
 f6JtUMZnPJpsJpCmzbHWm1zJzuICNbbaeV6sfwx6K7d9+9kUu0nBv4Uq4/ZAB9N7aFSqDQbbwv85H
 aL05hvls57aLnq1sbyhnQRoqGE0B1mAJW61Hfy3msM52qVqGXmTs5n052unuP7P9E2Fs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FjNHaBd8/hOFw5UP0yM788NJkfXYhJ1t/Q1rivxWvDM=; b=FH8Z9VSKJdE/h/oLb6ohCDtkol
 ZDTJiK/Tt19i5C2w3viOdGKd7LmJpl/XY9qCUrYklvrPmsXPDMS3k/OfcP20uCQcvoeYyN5D3g5Ie
 /cMt2yvbmE02HQP1rOOxR3PxPEoL/PQ2Bm2p/3WkgVWWuWf5/GC8CYNLf5om3zbGzJME=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vgfaO-00017h-E9 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 16 Jan 2026 08:53:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A9F60601B4;
 Fri, 16 Jan 2026 08:53:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59B5AC2BCB6;
 Fri, 16 Jan 2026 08:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768553609;
 bh=QNbCEM/CPbisel6FUSp83Gcjx7gbMxEpasASgx5g+NQ=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=NEymhmaGTEcYhdqht4sekH5v2qIhZybo3ZId8AbZS/HbU/RRMYEafgseIJs58Gpwc
 ArO+xQlUl7coNJf5YyMVZCrJAxdsB/m5ux3khkZU27/sbqK1Si/fO1iQRU59p2btz9
 any1GmcgSGx82cYbXJw3gfmP3y7Ny9YEWGJ7jXhuuVYqKNoIGP112U3edPMn5MvM6i
 Z4LwQKCIreIelS0Pw3afi4Qik2HW55JbQyjyam7rEew959lsp5X64TJ7SHco+7PKd8
 aJg5J/mXCp5WmmpjojVDpyzeG8ECFRQ3p+0EnkpXDqjimlx82Ia1ua2Zq0qMLSUaDI
 3k36ojOOVcdhg==
Message-ID: <564a4389-f462-48b3-bd1a-cc4fbb0a6e88@kernel.org>
Date: Fri, 16 Jan 2026 16:53:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260111100941.119765-1-nzzhao@126.com>
 <20260111100941.119765-2-nzzhao@126.com>
 <0aca7d1f-b323-4e14-b33c-8e2f0b9e63ea@kernel.org>
 <13c7c3ce.71fa.19bb1687da1.Coremail.nzzhao@126.com>
 <5158ff31-bd7b-4071-b2b1-12cb75c858dd@kernel.org>
 <aWZ7X9yig5TK2yNN@google.com>
Content-Language: en-US
In-Reply-To: <aWZ7X9yig5TK2yNN@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 1/14/2026 1:05 AM, Jaegeuk Kim wrote: > On 01/12, Chao
 Yu wrote: >> On 1/12/2026 4:52 PM, Nanzhe Zhao wrote: >>> >>> At 2026-01-12
 09:02:48, "Chao Yu" <chao@kernel.org> wrote: >>>>> @@ -2545,6 +254 [...] 
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
X-Headers-End: 1vgfaO-00017h-E9
Subject: Re: [f2fs-dev] [PATCH v2 1/2] f2fs: add 'folio_in_bio' to handle
 readahead folios with no BIO submission
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
Cc: linux-fsdevel@vger.kernel.org, Nanzhe Zhao <nzzhao@126.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 1/14/2026 1:05 AM, Jaegeuk Kim wrote:
> On 01/12, Chao Yu wrote:
>> On 1/12/2026 4:52 PM, Nanzhe Zhao wrote:
>>>
>>> At 2026-01-12 09:02:48, "Chao Yu" <chao@kernel.org> wrote:
>>>>> @@ -2545,6 +2548,11 @@ static int f2fs_read_data_large_folio(struct inode *inode,
>>>>>     	}
>>>>>     	trace_f2fs_read_folio(folio, DATA);
>>>>>     	if (rac) {
>>>>> +		if (!folio_in_bio) {
>>>>> +			if (!ret)
>>>>
>>>> ret should never be true here?
>>>>
>>>> Thanks,
>>> Yes.Need I send a v3 patch to remove the redundant check?
>>
>> Yes, I think so.
> 
> Applied in dev-test with it.

For upstreamed version,

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,

> 
>>
>> Thanks,
>>
>>>
>>> Thanks,
>>> Nanzhe Zhao



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
