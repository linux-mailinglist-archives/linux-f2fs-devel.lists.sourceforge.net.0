Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB38999F75
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 11 Oct 2024 10:57:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1szBSO-0005zc-LF;
	Fri, 11 Oct 2024 08:57:08 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1szBSJ-0005zQ-8Z
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 11 Oct 2024 08:57:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vM1F9ZSCvnmMRcrhgtUw5pgW4bl9xOHOSA1nmkzR4SM=; b=TvlBK2dAGtOfveR7kogK5HEe+e
 bzEQ5+BSJczny150Auor5MYG8rdVCV3NoE6f4WlpuZSUYY8mkeubU52yiOtqtf5Xi92VeBzvBo2lE
 kNrh0TzeZAmEUAuk17K4r0dW1FrL/zp3xSumci3qQ1qbUr5Jaeq+ThSip4cxEAGrh57Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vM1F9ZSCvnmMRcrhgtUw5pgW4bl9xOHOSA1nmkzR4SM=; b=NgBM+dbAlOYRt7Y9sle+bIo1Bj
 MdLCEP7ffGbud+iOnBymza55ZLlg3K/4zdlZyWawm7Yz84UNNPR0Ki7m7Ox5z0GDiC0Vz0UMXu6US
 Ch17pCOzxFEKz1OUMiUhL6yYShuEqpueDuap/ef7P8UP1qDVXE0nrUYgCXaUMRln6KXU=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1szBSI-00025h-Fn for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 11 Oct 2024 08:57:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D101BA4528E;
 Fri, 11 Oct 2024 08:56:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD7DBC4CEC3;
 Fri, 11 Oct 2024 08:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728637016;
 bh=O8UMgy4NK3I9Ac3Z4UxYDyPfUUZlGgk3rritssUgmSE=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=ZTArbzVFqv+vzi6Ln/obGoDSQd75fU7AS/1J/rnwZ9ku7vVaqKOt4oBS7JFJl97LO
 yfC4gpjRIdwLUVcsR9aNXaQ6VxmcJjgqc03c2XxyAheP9pjPRqKKdIVrJRezZcmW7+
 u7ukKjQBckULxox8wj4bRRfYoIAOsNmJ8L6ZPg91RV4KwaOr43dORcPYh54BY6GKfA
 7jcHaXhmB6Yr6s1PdvDKz/PoD24aPBKaeXx1xn1bWJCfC7unyVJ9J60SyCACrCVTR6
 7nFcVxyZz16BTAgYSUOGucG0jGiJ+vlDb+LhwhTgc1Ntryp70OhvnjbNbVa8XXHbce
 XYBaxpbPM8g0g==
Message-ID: <94166f32-7ff9-46d2-83c9-4df2a787fe25@kernel.org>
Date: Fri, 11 Oct 2024 16:56:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Matthew Wilcox <willy@infradead.org>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20240926140121.203821-1-kernel@pankajraghav.com>
 <ZvVrmBYTyNL3UDyR@casper.infradead.org> <ZvstH7UHpdnnDxW6@google.com>
Content-Language: en-US
In-Reply-To: <ZvstH7UHpdnnDxW6@google.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/10/1 6:58, Jaegeuk Kim wrote: > On 09/26, Matthew
 Wilcox wrote: >> On Thu, Sep 26, 2024 at 04:01:21PM +0200,
 Pankaj Raghav (Samsung)
 wrote: >>> Convert wbc_account_cgroup_owner() to take a fol [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1szBSI-00025h-Fn
Subject: Re: [f2fs-dev] [PATCH] fs/writeback: convert
 wbc_account_cgroup_owner to take a folio
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
Cc: Jan Kara <jack@suse.cz>, linux-doc@vger.kernel.org,
 "Darrick J . Wong" <djwong@kernel.org>, Chris Mason <clm@fb.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>, Zefan Li <lizefan.x@bytedance.com>,
 Jonathan Corbet <corbet@lwn.net>, gost.dev@samsung.com,
 "Pankaj Raghav \(Samsung\)" <kernel@pankajraghav.com>,
 linux-ext4@vger.kernel.org, Pankaj Raghav <p.raghav@samsung.com>,
 Josef Bacik <josef@toxicpanda.com>, linux-fsdevel@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, David Sterba <dsterba@suse.com>,
 cgroups@vger.kernel.org, Christian Brauner <brauner@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 mcgrof@kernel.org, =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Tejun Heo <tj@kernel.org>,
 akpm@linux-foundation.org, linux-btrfs@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/10/1 6:58, Jaegeuk Kim wrote:
> On 09/26, Matthew Wilcox wrote:
>> On Thu, Sep 26, 2024 at 04:01:21PM +0200, Pankaj Raghav (Samsung) wrote:
>>> Convert wbc_account_cgroup_owner() to take a folio instead of a page,
>>> and convert all callers to pass a folio directly except f2fs.
>>>
>>> Convert the page to folio for all the callers from f2fs as they were the
>>> only callers calling wbc_account_cgroup_owner() with a page. As f2fs is
>>> already in the process of converting to folios, these call sites might
>>> also soon be calling wbc_account_cgroup_owner() with a folio directly in
>>> the future.
>>
>> I was hoping for more from f2fs.  I still don't have an answer from them
>> whether they're going to support large folios.  There's all kinds of
>> crud already in these functions like:
>>
>>          f2fs_set_bio_crypt_ctx(bio, fio->page->mapping->host,
>>                          page_folio(fio->page)->index, fio, GFP_NOIO);
>>
>> and this patch is making it worse, not better.  A series of patches
>> which at least started to spread folios throughout f2fs would be better.
>> I think that struct f2fs_io_info should have its page converted to
>> a folio, for example.  Although maybe not; perhaps this structure can
>> carry data which doesn't belong to a folio that came from the page cache.
>> It's very hard to tell because f2fs is so mind-numbingly complex and
>> riddled with stupid abstraction layers.
> 
> Hah, I don't think it's too complex at all tho, there's a somewhat complexity to
> support file-based encryption, compression, and fsverity, which are useful

I agree w/ Jaegeuk.

> for Android users. Well, I don't see any strong needs to support large folio,
> but some requests exist which was why we had to do some conversion.
> 
>>
>> But I don't know what the f2fs maintainers have planned.  And they won't
>> tell me despite many times of asking.

I supported large folio in f2fs by using a hacking way /w iomap fwk, it can
only be enabled in very limited condition, after some seqread tests, I can
see performance gain in server environment, but none in android device, and
in addition, there is a memory leak bug which can cause out-of-memory issue.
Unlucky, I have no slots to dig into these issues recently.

Thanks,




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
