Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2A9A95C33
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 22 Apr 2025 04:40:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u73Yd-0005a2-Ee;
	Tue, 22 Apr 2025 02:40:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sandeen@redhat.com>) id 1u73Yb-0005Zv-K1
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 22 Apr 2025 02:40:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pyDcFYqaztjW8wqaOBmIzVgkhhvkajnReTQLh/Jex40=; b=mpCWk2SWSJzqnzOUSUvJ1NSgS+
 bLiHZdBbThOGGM3yXiLVHUIlvkfCU+RG2N/+8xv3N5aUleCM4zEWMHtzyzNkRtgvRzKQitUdgJChR
 DoWqP3JAHemtIc5sU6ShzwmJdlTMQWAgtev30TvFn0uJwJGTzwrsLK6RJIFSdU1KVbUY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:From:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pyDcFYqaztjW8wqaOBmIzVgkhhvkajnReTQLh/Jex40=; b=mEsup1unAXGTbf+TOxWtRqTNlA
 7Z2flaAYgou2sHFs2TPXZQdZw0/SvS2u8T2WsIyU+FC2DGStrSiY1Jq7Z7g3CfL144jzTw7LNogdv
 DJHFh9/uoDqdmzpNtg02VW12JxuxUrRUkzkInqpD3XYw83o6DUC8bbcnGu44sqE/Nexc=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1u73YM-0003ky-6o for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 22 Apr 2025 02:40:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745289590;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pyDcFYqaztjW8wqaOBmIzVgkhhvkajnReTQLh/Jex40=;
 b=guijnS35msq7d5w9cqv+gWUAvT+gyevdnJ1fdIIp0dI6KT8XXYjbUEeLB8kKQRe1/Ksj3M
 NtklqaSEOv5pAXGQesQNZBo+tiYbSU12Mok1M+FNMZC7AXGsrDVYypIjlbq8Tklv94NjYb
 17sAH9ljNurmyZA2mV8ihk0KYWEsHpw=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-261-93o45pXJNlyhETfZ95kB7w-1; Mon, 21 Apr 2025 22:39:48 -0400
X-MC-Unique: 93o45pXJNlyhETfZ95kB7w-1
X-Mimecast-MFC-AGG-ID: 93o45pXJNlyhETfZ95kB7w_1745289588
Received: by mail-il1-f198.google.com with SMTP id
 e9e14a558f8ab-3d8fc035433so58205285ab.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 21 Apr 2025 19:39:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745289588; x=1745894388;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pyDcFYqaztjW8wqaOBmIzVgkhhvkajnReTQLh/Jex40=;
 b=VM5FZ0AN7jrCVKU3LjnNkWgU/4/ULhjaUAsTAzh65PSYL0B4b6CZEYyqn7GrMpkNw9
 Ny9SmOheyWMWQpF2cLT/lzTs+4n3TheRBMTDGlfDqSgn8SVkM2zDlBCVbk3BAObFtGNw
 bTs6mF3aidpSo9IcZ+0ZLTcxpmQYa8g/oXflJ0Dc1MwKJurQwYsErtuklAjZyFughP3W
 tkqNg52H+UiI6uX+xdVF2NMmDK/ENkg4XaBPua/IS1+dU0BHRXt/5Pf14D7W9BsjYbHF
 zyUzaDkGQEIyg40TQosZbSOxmFIpzMH/u8Wpw2dL2kzBGINVoTqNoEnChEYumBBoUODx
 I9PA==
X-Gm-Message-State: AOJu0YwY2z/vfkMy9xHfGW3uw2oBKJ7cIIqbHcFj/S+oMIaLnUgUow3N
 QIcQ71WgqVH4GzNxPmLP9nyM7ZLEHtbq8bv7uNbXWTKoIpcxYq+BgrbJxJHrki4RNAmS/yT1SFk
 ErEjgEnllhY1qaPr+gR+iYxNvSEqR4g2uG9ZJdMKJ8DEBHpzgLdHL3oShKax/yBvWPojVUlaOhI
 gZw7otZo0Yfl3DP7cjYRYmvDtbyn4I/OAvKlX1JtanXWNO+L4RFvw2hPQ8AQ==
X-Gm-Gg: ASbGncvgZ7BjNZlljA7dk0IBY05mtkclte8XeZHpaUnvd6NPfqRsnJJnojXAlR5hYzB
 Bnwmig93n/GVveIp92X0eVqVER9W5l82/EWsiPMsyJ0gr5E2MCb1IJC2gVK4N3qjGgDsD7KlYKy
 Q2sGVimjI806OBdPC2HVW22OtZlvreHepUAvxdTB8BwWgy/6hJhKZG4kSyEbPH7p8DVha1Q4tVv
 CX5fc+LNVkDJJnHRecuMeJ4QIJ7RyY/yZqzRjVZBFR7er+7YYkjcobzV2I9kYf2HO4eR2ogYwXh
 E4E/u2mm3npOfMITirI=
X-Received: by 2002:a05:6e02:144b:b0:3d0:4bce:cfa8 with SMTP id
 e9e14a558f8ab-3d88eda86a7mr127056855ab.3.1745289587883; 
 Mon, 21 Apr 2025 19:39:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+PgMGlCD9AkAJAGaMvk/H7oo78RUGqiGCD+M4Q/Y7QmJRC4KUtzJGwo9PdoGdwt1N6Wwfxw==
X-Received: by 2002:a05:6e02:144b:b0:3d0:4bce:cfa8 with SMTP id
 e9e14a558f8ab-3d88eda86a7mr127056665ab.3.1745289587583; 
 Mon, 21 Apr 2025 19:39:47 -0700 (PDT)
Received: from [10.0.0.82] ([65.128.104.55]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4f6a37cbb4fsm2100574173.16.2025.04.21.19.39.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Apr 2025 19:39:47 -0700 (PDT)
Message-ID: <5225e8d5-8807-4e33-8e23-a6d19c7b9f77@redhat.com>
Date: Mon, 21 Apr 2025 21:39:46 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-f2fs-devel@lists.sourceforge.net
References: <20250420154647.1233033-1-sandeen@redhat.com>
In-Reply-To: <20250420154647.1233033-1-sandeen@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lZ00bhUFAijznQIpd92CR662suWUZXD-YIHBmryugyM_1745289588
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/20/25 10:24 AM,
 Eric Sandeen wrote: > This is a forward-port
 of Hongbo's original f2fs mount API conversion, > posted last August at >
 https://lore.kernel.org/linux-f2fs-devel/20240814023912.3959 [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.129.124 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.129.124 listed in sa-accredit.habeas.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.129.124 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [170.10.129.124 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1u73YM-0003ky-6o
Subject: Re: [f2fs-dev] [PATCH 0/7 V2] f2fs: new mount API conversion
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
Cc: linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, lihongbo22@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 4/20/25 10:24 AM, Eric Sandeen wrote:
> This is a forward-port of Hongbo's original f2fs mount API conversion,
> posted last August at 
> https://lore.kernel.org/linux-f2fs-devel/20240814023912.3959299-1-lihongbo22@huawei.com/

I'll rebase this onto jaegeuk's dev tree and send a V3.

-Eric



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
