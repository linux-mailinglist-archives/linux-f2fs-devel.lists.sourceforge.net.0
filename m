Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 231E76471EA
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  8 Dec 2022 15:39:28 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p3I3Y-00088e-Mi;
	Thu, 08 Dec 2022 14:39:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <usama.anjum@collabora.com>) id 1p3I3F-00087N-Gi
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Dec 2022 14:39:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=L8Y+OocOdMPk+H1xCJylChWv9i1BPxoIp8yDwrSdzb4=; b=hs6WHZ8toprM6LbJLhDRSUdZOB
 Ho28AtDre4ZFXJ7jEY5MkHFj7iNQUrusC26r9D3yj+6X/llrNW8wcANyPwDVbssrEKYx6nJXqyaPl
 z/WdsMIXQFb2VhvDMVu+pq3lt+U1MT+M2Pd6sgwFIDYvaTKftwUWR2vPOQy8NZr06qog=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=L8Y+OocOdMPk+H1xCJylChWv9i1BPxoIp8yDwrSdzb4=; b=FY0Dm5QysCxnDUrOWSJ8ceeTkg
 z3xCL2Yh4WNg6Bw3Adx8twBhgKy0YHKOFutfIgt7Cs5SN4UKBdFVlXzAk6tdOyKaj+kbua5JK1Ieh
 Mbc0ui9eeshou6A+ThPSamBbBo6Ql62dqgoD7lrC3epFCq3NkyYAP7DZxtwVr596oc1A=;
Received: from madras.collabora.co.uk ([46.235.227.172])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p3I3C-0007lp-8f for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Dec 2022 14:39:03 +0000
Received: from [192.168.10.9] (unknown [39.45.130.220])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: usama.anjum)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id C0AAC6600358;
 Thu,  8 Dec 2022 14:38:50 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1670510332;
 bh=fVIPKPFDngLOHac5pI91xJzjXDvZH+tRu3bzX92i4Wg=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=RbyVPBipXibYq+GTsHGkpBb/xCG0ZMDylqr7AKlYYICOZwrakPvQHk6mWUaF/PCTT
 CXaEtbqB1ewYOkcoGeJJHX+v5FW/QoqmeArPu7Rhi7/atSjtTi+vhSzNxq6gEWpX48
 UR/jTk2c4FYcVjjsWqiqXtdxGhkI4Kj0CUvbaiOBVFRw0O1A1qhTUGoqzl9Y/gaITk
 ORTOT7tfbMDmDsR18XWA7w4/5Oj9hU2c2ygq5NBjfrW+YNGU1tsIwXvO0bo3JgOodG
 U8DP/ceYeWgInDRg62lA7jECD5g741ZtOtD6SFsJBcawe0bnTLWYIbIvU/UA7a1fUz
 b8Ze56T1pSDig==
Message-ID: <2859a108-3189-6407-2d11-6b9f0948f718@collabora.com>
Date: Thu, 8 Dec 2022 19:38:46 +0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
To: Gabriel Krisman Bertazi <gabriel@krisman.be>, tytso@mit.edu,
 Eric Biggers <ebiggers@kernel.org>
References: <20220913234150.513075-1-krisman@collabora.com>
 <Yy0t8WYhM+Dv3gX1@sol.localdomain> <87fsgi2lax.fsf@collabora.com>
 <87tu47thie.fsf@suse.de>
Content-Language: en-US
From: Muhammad Usama Anjum <usama.anjum@collabora.com>
In-Reply-To: <87tu47thie.fsf@suse.de>
X-Spam-Score: -2.2 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 10/14/22 4:45 AM, Gabriel Krisman Bertazi wrote: > Gabriel
 Krisman Bertazi <krisman@collabora.com> writes: > >> Eric Biggers
 <ebiggers@kernel.org>
 writes: >> >>> On Tue, Sep 13, 2022 at 07:41:42PM [...] 
 Content analysis details:   (-2.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: collabora.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1p3I3C-0007lp-8f
Subject: Re: [f2fs-dev] [PATCH v9 0/8] Clean up the case-insensitive lookup
 path
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
Cc: linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 adilger.kernel@dilger.ca, jaegeuk@kernel.org, kernel@collabora.com,
 Muhammad Usama Anjum <usama.anjum@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 10/14/22 4:45 AM, Gabriel Krisman Bertazi wrote:
> Gabriel Krisman Bertazi <krisman@collabora.com> writes:
> 
>> Eric Biggers <ebiggers@kernel.org> writes:
>>
>>> On Tue, Sep 13, 2022 at 07:41:42PM -0400, Gabriel Krisman Bertazi wrote:
>>>> Hi,
>>>>
>>>> I'm resubmitting this as v9 since I think it has fallen through the
>>>> cracks :).  It is a collection of trivial fixes for casefold support on
>>>> ext4/f2fs. More details below.
>>>>
>>>> It has been sitting on the list for a while and most of it is r-b
>>>> already. I'm keeping the tags for this submission, since there is no
>>>> modifications from previous submissions, apart from a minor conflict
>>>> resolution when merging to linus/master.
>>>
>>> Who are you expecting to apply this?
>>
>> Hi Eric,
>>
>> There are three groups of changes here: libfs, ext4 and f2fs.  Since the
>> changes in libfs are self-contained and only affect these two
>> filesystems, I think it should be fine for them to go through a fs tree.
>>
>> The bulk of changes are ext4, and Ted mentioned on an earlier version
>> that he could pick the first patches of this series, so I'm thinking it
>> should all go through the ext4 tree.  If Jaegeuk acks, the f2fs changes
>> are safe to go with the rest, or I can send them afterwards as a
>> separate series once the libfs code is merged.
> 
> Ted,
> 
> Does the above plan work for you? Do you intend to pick this up for the
> next merge window?
It seems like this series hasn't been picked up. Any ideas on what can be done?

-- 
BR,
Muhammad Usama Anjum


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
