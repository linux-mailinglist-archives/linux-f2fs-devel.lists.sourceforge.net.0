Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C0070AAD3A3
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 May 2025 04:56:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9KjA/XAsr+7oPawPD+q57iE8P5Kk42XduMHkdC3ALW4=; b=Yn0E4EJp5tTMhDFmPpAI5y792K
	guxe3lxIvcjr3MoJhfSDz+gFbIYkxi+ir9wBYIaD3ur3kRF5LKW2v2vFL3b3N4TNZOYuj2YAdrXb1
	IagUES2dtEzdZ2TOn/EY986n395rpVtKf0TkdIVSCuci9JPNlpzR2k+oiovk0DlOuT8U=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uCUxh-000815-MH;
	Wed, 07 May 2025 02:56:45 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sandeen@redhat.com>) id 1uCUxg-00080y-CI
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 May 2025 02:56:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6v13hBXxOIEJvuIfma0sX2loz9ZFHIAPS4YyMthI+CY=; b=j3ItCdgPPASRStUL5wXlfpIXAU
 Y9oHpVbuZxg+RYAkgTbkm/7DiuGo+OZvJhEDGkCb28ryVAGJidxhI7Wb2yEi5ThbiFkamE1C4ZryY
 4Pw2JK0fahTtWjmcDE1CVr9iZvs/+4BuhpqfbmL3MXTzFJrtExK4AS5Gt7DAblT4qTE4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6v13hBXxOIEJvuIfma0sX2loz9ZFHIAPS4YyMthI+CY=; b=k3cMQshZI00EsUe4+QUrJjPzC1
 SxX4qvH+4F6sDBuTKRZUNcJMY2QDmGiRcuNTWIWlHybJIaboXBtkP8YaqgE3/xUCczqOZOxCFWyLJ
 KuiAq+WOM4erKRhfRFvNS//qVr78tNXKXOTsqGR8idKjMOZEqFIWInWPtxCbObpCZgYM=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uCUxP-0007y0-Qb for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 May 2025 02:56:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746586581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6v13hBXxOIEJvuIfma0sX2loz9ZFHIAPS4YyMthI+CY=;
 b=d2AWDOYUD/o67bWpl3XyPAycVpBunyHbMBQLlQJ/XFRERdw8FoKsy441n1Sn13K6hzi4R1
 urrOW5NLVipkBwWZb9fABW/eFlJQCEUNDsVWLJGF3Bzbv+hhhv4ZDf27Ti9Tfy2I+TT7Gq
 n122qh6QBfMCrSQAPrYGfTr17Nra/a8=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-322-1eNYIIPcPYGDZ1dC3PGuRg-1; Tue, 06 May 2025 22:56:20 -0400
X-MC-Unique: 1eNYIIPcPYGDZ1dC3PGuRg-1
X-Mimecast-MFC-AGG-ID: 1eNYIIPcPYGDZ1dC3PGuRg_1746586579
Received: by mail-il1-f200.google.com with SMTP id
 e9e14a558f8ab-3d6e10f4b85so114056455ab.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 06 May 2025 19:56:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746586579; x=1747191379;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6v13hBXxOIEJvuIfma0sX2loz9ZFHIAPS4YyMthI+CY=;
 b=tgjoH9c1DpYeP4D4ip8NyyaBp7LSGXQfW1QFONLKpkK+tC9cOCyh17UGY161rrODqx
 JYeQxj67RMRgwTWq4L6HRGcIDpnKHES+kAj2wUSggJUsYF7WnfOvEy7Aby7MxkPOEtzC
 BCaObg6ynz2npB4/Fj4w+H65P+qVrYPVv+sRRGnCfiGJpGAx+t4dPrynG+bOjW3FVR1Z
 XW1Kqk4jf8nlJmYtGF1NjlKEu+h6lKE8zcC+0cXcWARXdTBkx3fQsaFVCjcLBeRakF6a
 2caLIZjXEE6HcVV19we14RcdqHjJXz4JF79V3YTzLXuNwCxu2EevSwpsvVXOAsZ+M7aE
 nwtg==
X-Gm-Message-State: AOJu0YyCdgC6TfPIVfKL6tc7FmbhAzMJVO7LxjhG8dNtF6/LLV7cnkh+
 +aoREcoSDJAV1XhlOwnBvElu4VrYtyXmwFURz9/LyYNV8I/PkqiTXoxxkdah9Av/bgD393oZJiW
 wQCNA6scJ7Q52oZIJycV6WzO9bwYKE0+7CQsRbAuTGfXcmAu8QXdCLbg8luCESCE2/7iS0YBYPI
 A=
X-Gm-Gg: ASbGnctiiE+91COC5k14tdorpy6nD3CyvDP92LO+Ifzy+hCU3dlOePJndwWFGhqGA76
 5/5x/meccy6jm+zT7D632xYGcH/Di5dWXQZx5BeTlZCMCFo6U9ORiEi6lwRdS/Vk/MAllVxl+kW
 637IAkk9dUvU93wWGN9rZYD5KEGnsDFS4UzVw/9gUN1C+NIcRnTyjwDlwRCjrm9LseRpUy9WXSh
 kvB8uN9fs3rL+yso2mLL8GX3HyuvjIKXh7tEpoZOttJSGcCCjXE8hGOTHWKyw65KmLPDltbx1yM
 uEbvney/ibb9IbbfyZHaQl82Ve9yWV039+kGar9O+AlROaKrmJIS
X-Received: by 2002:a05:6e02:1529:b0:3d5:8103:1a77 with SMTP id
 e9e14a558f8ab-3da738ed6c7mr15950765ab.1.1746586579119; 
 Tue, 06 May 2025 19:56:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvhazwqX/isryjo2Em58HlkEQs6DbIsyogQaU4RF5dJTGp+n9kI8lL0SQS1m+Sp3HWH7IxmA==
X-Received: by 2002:a05:6e02:1529:b0:3d5:8103:1a77 with SMTP id
 e9e14a558f8ab-3da738ed6c7mr15950615ab.1.1746586578854; 
 Tue, 06 May 2025 19:56:18 -0700 (PDT)
Received: from [10.0.0.82] (75-168-235-180.mpls.qwest.net. [75.168.235.180])
 by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3d975ec7df4sm28463795ab.32.2025.05.06.19.56.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 May 2025 19:56:18 -0700 (PDT)
Message-ID: <380f3d52-1e48-4df0-a576-300278d98356@redhat.com>
Date: Tue, 6 May 2025 21:56:16 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20250423170926.76007-1-sandeen@redhat.com>
 <aBqq1fQd1YcMAJL6@google.com>
 <f9170e82-a795-4d74-89f5-5c7c9d233978@redhat.com>
 <aBq2GrqV9hw5cTyJ@google.com>
In-Reply-To: <aBq2GrqV9hw5cTyJ@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XWUt7WEHiLVfaUpLDv-8kK7BPQlgI79_nx4tfeLME4o_1746586579
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 5/6/25 8:23 PM, Jaegeuk Kim wrote: > On 05/06,
 Eric Sandeen
 wrote: >> On 5/6/25 7:35 PM, Jaegeuk Kim wrote: >>> Hmm, I had to drop the
 series at the moment, since it seems needing more >>> work to [...] 
 Content analysis details:   (-1.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.133.124 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.133.124 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [170.10.133.124 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.133.124 listed in list.dnswl.org]
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
X-Headers-End: 1uCUxP-0007y0-Qb
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

On 5/6/25 8:23 PM, Jaegeuk Kim wrote:
> On 05/06, Eric Sandeen wrote:
>> On 5/6/25 7:35 PM, Jaegeuk Kim wrote:
>>> Hmm, I had to drop the series at the moment, since it seems needing more
>>> work to deal with default_options(), which breaks my device setup.
>>> For example, set_opt(sbi, READ_EXTENT_CACHE) in default_options is not propagating
>>> to the below logics. In this case, do we need ctx_set_opt() if user doesn't set?
>>
>> Hm, can you describe the test or environment that fails for you?
>> (I'm afraid that I may not have all the right hardware to test everything,
>> so may have missed some cases)
>>
>> However, from a quick test here, a loopback mount of an f2fs image file does
>> set extent_cache properly, so maybe I don't understand the problem:
>>
>> # mount -o loop f2fsfile.img mnt
>> # mount | grep -o extent_cache
>> extent_cache
>> #
>>
>> I'm happy to try to look into it though. Maybe you can put the patches
>> back on a temporary branch for me to pull and test?
> 
> Thank you! I pushed here the last version.
> 
> https://github.com/jaegeuk/f2fs/commits/mount/
> 
> What about:
> # mount -o loop,noextent_cache f2fsfile.img mnt
> 
> In this case, 1) ctx_clear_opt(), 2) set_opt() in default_options,
> 3) clear_opt since mask is set?

Not sure what I'm missing, it seems to work properly here but I haven't
pulled your (slightly) modified patches yet:

# mount -o loop,extent_cache f2fsfile.img mnt
# mount | grep -wo extent_cache
extent_cache
# umount mnt

# mount -o loop,noextent_cache f2fsfile.img mnt
# mount | grep -wo noextent_cache
noextent_cache
#

this looks right?

I'll check your tree tomorrow, though it doesn't sound like you made many
changes.

> And, device_aliasing check is still failing, since it does not understand
> test_opt(). Probably it's the only case?

I think you can blame me, not Hongbo on that one ;) - I will look into it.

-Eric

>>
>> Thanks,
>> - Eric
>>
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
