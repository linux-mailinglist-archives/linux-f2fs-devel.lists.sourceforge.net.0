Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C858DAAD127
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 May 2025 00:54:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kubhJobD/xgcpkH0ILXt2Sc9RAxN2gi4SwfvIfzi0gE=; b=l0ZS0/oumy0hT/GVAxPnTz7nQf
	K+B5rYjN73kshupgHPX89Vpdz0sYhx+pbZAmUPU4VgQ04nE3OHaqd5JZaXIhddcxQHAdT1JgbOB+E
	/XnLgUBk5zRXCoYwOTtHxlXUlhnq39L3GRsBXJ3s/9DCgBLgTAbopMQdF5jGzh9iPNP0=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uCRAl-0008Oh-CA;
	Tue, 06 May 2025 22:53:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sandeen@redhat.com>) id 1uCRAj-0008OZ-Ku
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 May 2025 22:53:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0llTU71+wuu/2lptpCidsqva8hziTGM/xjlJt2eiFv0=; b=jQZZuGXE9DaS8zCoIUkWWkfC/M
 boSVhvQ8wodN6Cxmvug8iEBmBmWf28M3/9NoCAyRFj3thHV4sKikWP2rTsir7n4Ln1MaDqEIGqp94
 cBTGA+CcKWLd6Wsmipz6Ia8VUBTfXPRb8IL3za1S42LNT/v+XNImd4oyEUIn2ID+IyR4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0llTU71+wuu/2lptpCidsqva8hziTGM/xjlJt2eiFv0=; b=f21gd+UIbPRswCIPqK3X4Bjxdd
 GEl8YEc5rl5G1w9KxgHFPTBqVSyGuiOg+nkN29CiC023KZVEJauZEEKrO9goq1mrAevEU3BtUwKum
 2P6xzYMmrqcrRJ54q689u6fpy75a1hAe9gWsYh47XFBrqF0CptDLRO9ikd/0fNOAjKEA=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uCRAT-0006ne-Lq for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 May 2025 22:53:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746572010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0llTU71+wuu/2lptpCidsqva8hziTGM/xjlJt2eiFv0=;
 b=LEW3fLKu+7AJac8Gzgsh2n/23i++OT708WD7670aLaPi82gmhhB+YGPHLVEjlCYQyiCgfP
 JOlvU8rLjeUGaF8rExGz33wIejyFTp5rhpwmXqG2Sr3MdJdJ9Ri0MPrWziAjqLUfN9mNdZ
 vHEawpEVONt8r5vW8qZTl0/pJRVhi9M=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-196-AcHBLeoXNKyvGA59j8TLfw-1; Tue, 06 May 2025 18:53:29 -0400
X-MC-Unique: AcHBLeoXNKyvGA59j8TLfw-1
X-Mimecast-MFC-AGG-ID: AcHBLeoXNKyvGA59j8TLfw_1746572009
Received: by mail-io1-f70.google.com with SMTP id
 ca18e2360f4ac-85b53875729so1357688839f.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 06 May 2025 15:53:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746572008; x=1747176808;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0llTU71+wuu/2lptpCidsqva8hziTGM/xjlJt2eiFv0=;
 b=UzSvT7d4FOOWj6GFb3oIoy0h4SUHSr9kHkRIs1KGYmE5qwYQaTI8pu5uf0s/ebLl16
 2DbH1wpzJco9YWPtRbClB3ERGWP/nrYzCCo01nRBVI8ShCHred1c8tNJ4dW0ZhaGnsDe
 ktBhLgbgHCpqiQQdCzF9g8UyvR8CrlIkLT1PWVm7YllCiVlDchSLFjBdub5dBDHKA+pO
 MSfBhP8rPsrazpDjo9lKK+6NA6E+9nQ3p3yGCFjAlmqo7peZkl+9Gk5eo/NeOrgomv6K
 WtHTcYZXpWnA8Gr1vBRoYhCxS3JfTwsHlJTreRmlGgfnBnZ34vrgGQlnbT0GfyKSXjcS
 ic9w==
X-Gm-Message-State: AOJu0Yx98AJcNeLz8NyugdjpPXRbuG1QAa42DkufsBC1s9wK7hfjH8/4
 +XQ+GEoTFsoYtMpV87RjGuY3zemnkrgGDeFKXYw/prInPgVUUJ57onhUrTivX7HHCkC/fXVS3fu
 u0oFzPqhXoGnFchMj33zthUzQqebZ8KPfWV6rdKW19MZP9s/5ERecutZhfVS6WbuRhYjP9Qy/3L
 p76quXNGTbTg==
X-Gm-Gg: ASbGncuEDeYCnZlwBDXzPPMMyghg4e/WNzEbJXJLar4cV0sRohGrlVKn4aP+rpRb/We
 fdZA/H6C0XKSla1UUse6Gcq+zO+Myy4g7POSD4buccZeooYLGMZlKfd78bYlrgkdFFqn+qmx8uE
 6mfv/fU4VMvByleoWO/YOsKxYY0wR33QyWtF6uYRoC4sIYZWvLosoDjF/ZpmS7XOKefOHK1+M0b
 Cw/TVYSTnEKA4r3Q1emxydF0TTPSJeTTUBJVlZQr0Vyd6k1/qZWsnEzzEF1m/z/+/OpHp1YTDeY
 t8rIK6nmS7UUC7h1zAK56zABX4tDIfJ7PRERZ56IG8+Ko2BZoYYb
X-Received: by 2002:a05:6602:27c2:b0:864:4890:51e4 with SMTP id
 ca18e2360f4ac-867473b4e6emr199815439f.14.1746572008606; 
 Tue, 06 May 2025 15:53:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGLPyyvxoe9dOmqV4WB9DwYDkCW3IHrn9dC/80+fDwmnvpf0tcNHGSXbhPRHkxHvBRJErqXGA==
X-Received: by 2002:a05:6602:27c2:b0:864:4890:51e4 with SMTP id
 ca18e2360f4ac-867473b4e6emr199813639f.14.1746572008357; 
 Tue, 06 May 2025 15:53:28 -0700 (PDT)
Received: from [10.0.0.82] (75-168-235-180.mpls.qwest.net. [75.168.235.180])
 by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-864aa2b98f9sm234010739f.5.2025.05.06.15.53.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 May 2025 15:53:27 -0700 (PDT)
Message-ID: <118242b9-b64c-46dc-aa5a-99791c071234@redhat.com>
Date: Tue, 6 May 2025 17:53:26 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20250423170926.76007-1-sandeen@redhat.com>
 <b673458e-98b6-42ad-b95f-7a771cd56b03@redhat.com>
 <aBoys-gkIcu2AARF@google.com>
In-Reply-To: <aBoys-gkIcu2AARF@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Y_-ZmfRmMhBIioAMb-e5N21T2kLM4FMCAlZyIMGzybU_1746572009
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 5/6/25 11:02 AM, Jaegeuk Kim wrote: > On 05/05,
 Eric Sandeen
 wrote: >> Hi all - it would be nice to get some review or feedback on this;
 >> seems that these patches tend to go stale fairly quickly [...] 
 Content analysis details:   (-1.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.133.124 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.133.124 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.133.124 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [170.10.133.124 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uCRAT-0006ne-Lq
Subject: Re: [f2fs-dev] [PATCH V3 0/7] f2fs: new mount API conversion
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
From: Eric Sandeen via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eric Sandeen <sandeen@redhat.com>
Cc: linux-fsdevel@vger.kernel.org, lihongbo22@huawei.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 5/6/25 11:02 AM, Jaegeuk Kim wrote:
> On 05/05, Eric Sandeen wrote:
>> Hi all - it would be nice to get some review or feedback on this;
>> seems that these patches tend to go stale fairly quickly as f2fs
>> evolves. :)
> 
> Thank you so much for the work! Let me queue this series into dev-test for
> tests. If I find any issue, let me ping to the thread. So, you don't need
> to worry about rebasing it. :)

Thank you for queuing it, and Hongbo for the original series. Please reach
out if you encounter any problems.

-Eric

> Thanks,
> 
>>
>> Thanks,
>> -Eric
>>



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
