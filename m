Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFD56532AE
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Dec 2022 15:50:38 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p80QV-0007nv-Vk;
	Wed, 21 Dec 2022 14:50:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <s.shtylyov@omp.ru>) id 1p80QU-0007no-NV
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Dec 2022 14:50:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:References:CC:To:From:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dkEG6SlM6YIZUppIk216cZuxEpA+E+9JzJf5gooV6iU=; b=NYRxwiZUljLxrvaHTITA9K8sxH
 Ao25ZmV/aC9DUkK8sT5/4bFJCW9vyNWQJlQsoH/viDBqSQdpP7wijDt392/6Edx41jeTNd4Rhk3UR
 sglDj9lljD1YOMyn3L66g32d7iPvk0veDVtCYOhTsT0MhyyYq3d9ULJ8HINfaFrviNU0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:References:CC:To:From:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dkEG6SlM6YIZUppIk216cZuxEpA+E+9JzJf5gooV6iU=; b=hqy9t1afKQRnaOiEXMi9yhXRb2
 0IvXgBb8xGhF3F98WJMksCOV9vTT16EFOg8RTz7ihLjm/WEL8bX3aR+BMfg599WkR8vmTbLhUXdKr
 TFBpVWKyrvwaFUeRrDyJO3OaqXwHsKz5MexpST8p3RklBlx8Uefth3Qc1X/FjtcTNtZE=;
Received: from mx01.omp.ru ([90.154.21.10])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-SHA384:256) (Exim 4.95) id 1p80QT-006mRw-IH
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Dec 2022 14:50:34 +0000
Received: from [192.168.1.103] (178.176.72.202) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.986.14; Wed, 21 Dec
 2022 17:50:18 +0300
From: Sergey Shtylyov <s.shtylyov@omp.ru>
To: Yangtao Li <frank.li@vivo.com>, <jaegeuk@kernel.org>, <chao@kernel.org>
References: <20221221033021.36615-1-frank.li@vivo.com>
 <07bca981-edb0-aa85-28e2-ceaf58b6a519@omp.ru>
Organization: Open Mobile Platform
Message-ID: <87767c57-c50f-6a78-044e-9724bf7a272b@omp.ru>
Date: Wed, 21 Dec 2022 17:50:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <07bca981-edb0-aa85-28e2-ceaf58b6a519@omp.ru>
Content-Language: en-US
X-Originating-IP: [178.176.72.202]
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.59, Database issued on: 12/21/2022 14:38:06
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 174331 [Dec 21 2022]
X-KSE-AntiSpam-Info: Version: 5.9.59.0
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 502 502 69dee8ef46717dd3cb3eeb129cb7cc8dab9e30f6
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_arrow_text}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 178.176.72.202 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info: {Found in DNSBL: 178.176.72.202 in (user)
 dbl.spamhaus.org}
X-KSE-AntiSpam-Info: 178.176.72.202:7.7.3,7.4.1,7.1.2;
 d41d8cd98f00b204e9800998ecf8427e.com:7.1.1; omp.ru:7.1.1; 127.0.0.199:7.1.2
X-KSE-AntiSpam-Info: {iprep_blacklist}
X-KSE-AntiSpam-Info: ApMailHostAddress: 178.176.72.202
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 12/21/2022 14:41:00
X-KSE-AttachmentFiltering-Interceptor-Info: protection disabled
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 12/21/2022 10:52:00 AM
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-Spam-Score: -1.1 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/21/22 5:46 PM,
 Sergey Shtylyov wrote: >>> In expand_inode_data(), 
 the 'new_size' local variable is initialized to >>> the result of
 i_size_read(), 
 however this value isn't ever used, so we >>> can drop this initializer...
 >>> >>> Found by [...] 
 Content analysis details:   (-1.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -1.1 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1p80QT-006mRw-IH
Subject: Re: [f2fs-dev] [PATCH REPOST] f2fs: file: drop useless initializer
 in expand_inode_data()
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 12/21/22 5:46 PM, Sergey Shtylyov wrote:

>>> In expand_inode_data(), the 'new_size' local variable is initialized to
>>> the result of i_size_read(), however this value isn't ever used,  so we
>>> can drop this initializer...
>>>
>>> Found by Linux Verification Center (linuxtesting.org) with the SVACE static
>>> analysis tool.
>>>
>>> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
>>>
>>> ---
>>> This patch is against the 'dev' branch of Jaegeuk Kim's F2FS repo...
>>> Reposting with ISP RAS mailing lists CC'ed now...
>>
>> Why do you repeatedly send a patch

   Sorry, 1st time I forgot to do the internal CC dance -- CCing couple SVACE
(static analyzer) specific mailing lists...

[...]

>> Thx,
>> Yangtao

MBR, Sergey


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
