Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF9C4D2605
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  9 Mar 2022 02:24:49 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nRl4H-00036d-Al; Wed, 09 Mar 2022 01:24:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <axboe@kernel.dk>) id 1nRl4F-00036X-3I
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Mar 2022 01:24:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KpeRyglq/KKb6h+FPp2kPuLZPFCdso3DNN8oDwE8uJM=; b=iAeCmy1g9MexHfbLG66Tc/bdaK
 IfrlYvLQ3+7gAIpSknHCo81tO8FcJfxif4FE5zGtnuXi+xelAnHoPbQnsDMs3y7NpEPm5fKZamhW3
 +k2U+vc+LJ7iIqkzW+ZGFzBntWWHjCXB8xrXqzZA41EboofgLPXNoTPaYZCN4zO/HpXI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KpeRyglq/KKb6h+FPp2kPuLZPFCdso3DNN8oDwE8uJM=; b=k2yT/IfH5xbnWjk9zuZfQcXMCe
 3sz7nIKWktpI/wgYUEbsAGTMm16kHkt4Vk0OaEpyN8DZRO7/VXEb2IHRKOvrvtqNQNGoPARO6tdbg
 ApE5FiJUgYDx9Ya4lDHNMpl+BCJ0t/gNVsid5QZsss/rPPsRpaj1veMn5ovPT9Tcg258=;
Received: from mail-oi1-f173.google.com ([209.85.167.173])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nRl4B-009Ci6-Qt
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Mar 2022 01:24:41 +0000
Received: by mail-oi1-f173.google.com with SMTP id i5so1198792oih.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 08 Mar 2022 17:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=KpeRyglq/KKb6h+FPp2kPuLZPFCdso3DNN8oDwE8uJM=;
 b=sIS5e4ip/C/OQYpC1HbLN3p/gS7oZxzSenbpbk+Qu9qLfk3/4NcyDvpTulApQ/5YfY
 WEKzfrYxC89sfiwYPEegV84r0VtDAe2D7NhN4aWUuf6RBMjuPh933SqiiZCJyIHQNx/7
 4baLL4jVOMHMGwCj4xDzFSITORK6f4cvgrftMHEDfboidOgt9TEh6GsO0QETUDU9SD6w
 zqO3gJNJlqBoBIa56IB9qzZ9/S1Yq7VQ1mhODDkMXTleAXn0U6au23rOZMtlmM3dbOhC
 xkckm9zeJ0G8AQO1pOjy8WSt9SFZv4bMVALpP2eY0xCFNunsNQ/Ao3CdcdHtPmqKkJHo
 hWhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KpeRyglq/KKb6h+FPp2kPuLZPFCdso3DNN8oDwE8uJM=;
 b=6XV6oZTvZBdCAebbbg9OQUoJwbOzVXEdsvva/IFFhnkg0cUHws66CYpEr/0mFmuXc6
 SZDMs8J6Gv3ICIAdrhMSW/+6S9bPXqrj18RJ+IXGc/A/6YYX6PizGRU8FnAZipG/Go7S
 P3+ViA6FwD9kPkMh6dScUPDsZzLtPPFNlGodJlGvVr9/uN7E3rFUwoTCl20r9yJbP+NS
 5Vy8cQXQCLi3vtkccNh1e7Nftv+rwCO1EndU73lBJb3Pd8XcNypnCY7mg+fNtK0vRZeR
 Wq4g+sXFaf/2ikI27nWi2KHcMV/vPRkV/qnwLVz8H+jUWpx85o5TT1bRMkYmz2w7VFE+
 VtBg==
X-Gm-Message-State: AOAM5338pwwG4i15O2GU/SlpgmMwTQXqmcaYj+l2bKu/ElerS9SB4AgN
 lHUTyqMN1Uk4vZFHAg/OrDNpF68SvftJI5Bx
X-Google-Smtp-Source: ABdhPJw509jIgleFtjR4YJQ7shm6aXQ4P7p1SQgvGOXtMNxP2WiXmawU2fT5sxJzQFM599gtPxX+yA==
X-Received: by 2002:a17:90b:e08:b0:1bc:2b0c:65aa with SMTP id
 ge8-20020a17090b0e0800b001bc2b0c65aamr7527206pjb.102.1646787581515; 
 Tue, 08 Mar 2022 16:59:41 -0800 (PST)
Received: from [192.168.1.100] ([198.8.77.157])
 by smtp.gmail.com with ESMTPSA id
 om17-20020a17090b3a9100b001bf0fffee9bsm4519603pjb.52.2022.03.08.16.59.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Mar 2022 16:59:41 -0800 (PST)
Message-ID: <779bf1fe-7f58-51ed-27e8-1152375780ff@kernel.dk>
Date: Tue, 8 Mar 2022 17:59:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Chao Yu <chao@kernel.org>
References: <20220228124123.856027-1-hch@lst.de>
 <20220228124123.856027-3-hch@lst.de>
 <782226e0-5e7a-aec8-b9aa-e7fd7b3110a7@kernel.org>
 <20220308060624.GA23629@lst.de>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20220308060624.GA23629@lst.de>
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/7/22 11:06 PM, Christoph Hellwig wrote: > On Tue, Mar
 01, 2022 at 10:49:06AM +0800, Chao Yu wrote: >> On 2022/2/28 20:41, Christoph
 Hellwig wrote: >>> Refactor block I/O code so that the bio oper [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.173 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.167.173 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1nRl4B-009Ci6-Qt
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: pass the bio operation to
 bio_alloc_bioset
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 3/7/22 11:06 PM, Christoph Hellwig wrote:
> On Tue, Mar 01, 2022 at 10:49:06AM +0800, Chao Yu wrote:
>> On 2022/2/28 20:41, Christoph Hellwig wrote:
>>> Refactor block I/O code so that the bio operation and known flags are set
>>> at bio allocation time.  Only the later updated flags are updated on the
>>> fly.
>>>
>>> Signed-off-by: Christoph Hellwig <hch@lst.de>
>>
>> Reviewed-by: Chao Yu <chao@kernel.org>
> 
> Is it okay for Jens to pick these two patches up in the
> https://git.kernel.dk/cgit/linux-block/log/?h=for-5.18/alloc-cleanups
> branch?

I have tentatively done so, let me know you prefer doing it differently.

-- 
Jens Axboe



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
