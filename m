Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 258138C11C2
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  9 May 2024 17:13:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s55SM-0003xN-Kt;
	Thu, 09 May 2024 15:13:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <eugen.hristev@collabora.com>) id 1s55SK-0003xG-Mv
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 09 May 2024 15:13:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oW9itnaR2sUS4DLt7cvriRihoCjGCz3wn+1sdn+6LLk=; b=L8fLUzL6qCAAJdbCZ5+yxaK7Mn
 90YPRtvYQdkSRK0GsLxxLC6VnDCdyk1Vqw5YEIGRBtrIWrdhG/Nd1qRan0E0ULL/129XUm/mT5q4b
 9qkt/vwMjvIZpKd+7fCEhgBdvyDw+HnATTr1vHblJza3d2BAvDq1HNbWu1tEiSd6eVCc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oW9itnaR2sUS4DLt7cvriRihoCjGCz3wn+1sdn+6LLk=; b=csM8x39NRVC1keE4pc4QWaQEgF
 YPBdfmafzSAtiqxFKqsu3FLfkMSkG62HjchvsxfbDX8HKpNuL6tFxvmE29NlV5g9JOPXggMLTG85b
 QxAgA/L1NQ25D9yKMx2YirQZZ02tVD3uZ3tZnx4xPs3LPgOXKW+vcu6pLTejcBLrWkLk=;
Received: from madrid.collaboradmins.com ([46.235.227.194])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1s55SJ-0005Ki-Gr for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 09 May 2024 15:13:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1715267579;
 bh=8lKKZpJbPGF4Ani9x2yzwoaFUOf2+SAvjrEoKCY/6b8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=dgJJeTI4VC6HVio0YMhzY2T/au6hlCtrozPI+CNVt9+bbNmx7HV+7eTrkp3qvF7kR
 QyNmye2Lkapq9CscALNuaRXLgwOCpbO4sZhMqgJojh4C4+QzYxmTiw5KQ+DfQhLcmv
 v2ilcycsTHH47XGOKy93eeD+j6coEkrPM2GFG7Md+k7TM9aX4xvMYmOQCg1INx2coG
 BQCTviXy0QnDpUJM1VAMBcgrPnsM8uPSiO/qXBS6do9tGlv0BfaioyLkHUaLWN0NON
 8BWw4ahwv4cJSteFjaqjBCktxCjac4BPjx+SkeUUVdKnnXN1N/V6+VQ8XgWYZTKC7I
 dL1xcKQoBLx1w==
Received: from [100.90.194.27] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: ehristev)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 80E7737811CD;
 Thu,  9 May 2024 15:12:58 +0000 (UTC)
Message-ID: <1c4eae9a-ad82-4a89-9c0e-a0d61a4667f1@collabora.com>
Date: Thu, 9 May 2024 18:12:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Gabriel Krisman Bertazi <krisman@suse.de>
References: <20240405121332.689228-1-eugen.hristev@collabora.com>
 <Zg_sF1uPG4gdnJxI@casper.infradead.org>
 <ec3a3946-d6d6-40e1-8645-34b258d8b507@collabora.com>
 <87le5r3gw7.fsf@mailhost.krisman.be>
Content-Language: en-US
In-Reply-To: <87le5r3gw7.fsf@mailhost.krisman.be>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello Krisman, On 4/5/24 19:37,
 Gabriel Krisman Bertazi wrote:
 > Eugen Hristev <eugen.hristev@collabora.com> writes: > >> On 4/5/24 15:18,
 Matthew Wilcox wrote: >>> On Fri, Apr 05, 2024 at 03:13:23PM +0300, Eugen
 Hr [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: wikipedia.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1s55SJ-0005Ki-Gr
Subject: Re: [f2fs-dev] [PATCH v16 0/9] Cache insensitive cleanup for
 ext4/f2fs
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
From: Eugen Hristev via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eugen Hristev <eugen.hristev@collabora.com>
Cc: brauner@kernel.org, kernel@collabora.com, tytso@mit.edu, jack@suse.cz,
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, ebiggers@kernel.org,
 adilger.kernel@dilger.ca, viro@zeniv.linux.org.uk,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello Krisman,

On 4/5/24 19:37, Gabriel Krisman Bertazi wrote:
> Eugen Hristev <eugen.hristev@collabora.com> writes:
> 
>> On 4/5/24 15:18, Matthew Wilcox wrote:
>>> On Fri, Apr 05, 2024 at 03:13:23PM +0300, Eugen Hristev wrote:
>>>> Hello,
>>>>
>>>> I am trying to respin the series here :
>>>> https://www.spinics.net/lists/linux-ext4/msg85081.html
>>>
>>> The subject here is "Cache insensitive cleanup for ext4/f2fs".
>>> Cache insensitive means something entirely different
>>> https://en.wikipedia.org/wiki/Cache-oblivious_algorithm
>>>
>>> I suspect you mean "Case insensitive".
>>
>> You are correct, I apologize for the typo.
> 
> Heh. I completely missed it in the previous submissions. I guess we both
> just mentally auto-corrected.
> 
> Since we are here, I think I contributed to the typo in the cover letter
> with the summary lines of patch 1 and 2.  Differently from the rest of
> the series, these two are actually working on a "cache of
> casefolded strings".  But their summary lines are misleading.
> 
> Can you rename them to:
> 
> [PATCH v16 1/9] ext4: Simplify the handling of cached casefolded names
> [PATCH v16 2/9] f2fs: Simplify the handling of cached casefolded names
> 
> From a quick look, the series is looking good and the strict mode issue
> pointed in the last iteration seems fixed, though I didn't run it yet.
> I'll take a closer look later today and fully review.
> 

Have you managed to take a look ? What would be the future of the series ? I didn't
want to send another version for just a subject change, but I can if that's the
only change required .

Thanks,
Eugen


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
