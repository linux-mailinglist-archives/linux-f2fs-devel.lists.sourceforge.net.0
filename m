Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B09C8427B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Nov 2025 10:11:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I0YmbItRWA0JTPln+eDJyJGiHSD7hfGzxB7kW6lXzJ8=; b=dbKGfm+VEbfKKsls8YXuxjq6Bg
	pYHYu4E+GDWGE2NacZKJscxGXNBFzrDnDPxkYIVYLlsE7pgB6tWWQh0oVWRciJrytXCHwntijA0p6
	MO+oZArCh0Vwiqe9HOMWo678pPBN2WUVw3Jjj16QMFyUMG4H9zNyLEjuAJdWLu3XROE8=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vNp4z-0007Vk-FO;
	Tue, 25 Nov 2025 09:11:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong2021@gmail.com>) id 1vNp4w-0007Vc-TQ
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Nov 2025 09:11:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DYGc0UVlh4UKRfMBQFCXkuLAzjz8zcoSKckaPfM2Yx8=; b=jXF57edAVBELmNwaHlC26vdoug
 gHyVEFVCmRUdc4NBRYYQ3Pzkt/nOGaw7pWx13uI07SFOdT7AVqn0Uzl+TsEpg84YEOx3Ceh0CjUjl
 CCIYEtAQBVy9ksyZKG3AqAwMEtBoSuIMFWVxbsALdcvPcmqNQLzvdR/qkfyP5Pd9EHuY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DYGc0UVlh4UKRfMBQFCXkuLAzjz8zcoSKckaPfM2Yx8=; b=AISJ7CHw2eJ4qa2B+Tn3yLP026
 sjxzTUy9RY9xLMBQT+zkcjTKmr7mkeLVhPGNAVsE5wMWVBelngTCYVbhGX+yAMNnAynmwXKruDbrN
 h2lZLcrlAMJfN8JFQ9Ef6xHnIHpE6bDOvUldbFmE/OIbft0KhL6H0jiR+toZoAuDPmhU=;
Received: from mail-pf1-f178.google.com ([209.85.210.178])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vNp4w-0005Uk-AL for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Nov 2025 09:11:18 +0000
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-7b8e49d8b35so6186716b3a.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 25 Nov 2025 01:11:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764061868; x=1764666668; darn=lists.sourceforge.net;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:cc:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DYGc0UVlh4UKRfMBQFCXkuLAzjz8zcoSKckaPfM2Yx8=;
 b=AA/TvQZ2+6B2HTeO0oWIbgXge3dXXfQdOtCnMeA6/Lnu0McS/ZETFR+aezKQhNQZ7p
 AaaK/3U9Jkzxly4nitL5vI2TvSO4X/QBKExjJBPnHeRUdTs8RJbN7QXmQbt/ITqm7jSU
 f6ZYQwHVc2yU4B91fyneC09jy6cUknAtcqgRJIDtaxqcmH5iFsbLF+zcKsY2zBmGpfn+
 BDsLDflOc7QoK/IBeIGuTYK2lWoO+XVxan402lzgy5n+Rfc8uG8nDMjrNkjm3Gq2hSyW
 2Tbra+HJiLzn8fhppMzEYuEn4zCmReNXJIzxw4yTr6BJeYhJeaYvxTvDhRKbhMpHV7ub
 SnWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764061868; x=1764666668;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:cc:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DYGc0UVlh4UKRfMBQFCXkuLAzjz8zcoSKckaPfM2Yx8=;
 b=pOSEYOhkJ/2534Wv+9OjNR8yD1IxWPs1WLksLjBYsJbvSwRbVJQ/c8aUxbVbM4nAB7
 2ub932MKNTciknWIlXXqOM8qsLq9A2ZQPNDF6GYqFX3CHyOb8lgzcA77+BOVUnHzfAPU
 gpYzmEsTGQtQR95Cg/a6KWTQl+2dGSQClx6NlrLXiIjf2h5MCioGQFdj1N7Ne29KISyI
 F7gUqeQ9gIbk2c9B5ai6zwgFA3GuoVWopDgcEcX2S4a158eFxHX0ffouEH0jDACSovpR
 wfcc/2DLiwHGuysUT3uA/CPBS1+c2g/OEarmq+eX+BBVIktRr+UkaC3+saJifUUNp/dV
 RfUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUV5RMCcFocWm4FSI7tAiYBlUBUy81Q4Aleha54kFOJN08Dsr+Kys05MR9oxk5XMG8hAvnuJNxGmHgaEWfJ2zN2@lists.sourceforge.net
X-Gm-Message-State: AOJu0Ywad80y+Cj5srU632tdGrTBj4QhHUgRS/RnLXOL+RhEaq035KFy
 4p8wOZP32XTLOs5FMiKDu65gW9YyoU3i8ZLDYp49d/+VEdlvw/EF/c+v
X-Gm-Gg: ASbGncuuS4/tKvoTeAcCoQIGc5a8qycP7dlI2sMMM6FetEcZr6KfiJEbk0R6fJti7Vy
 QLhn4y/+jSHE+MMbIqSop7CRqqibs98hQdXzb769SopAX85vXIJp1WyoDX0iXcCvwHWfYbwGRC3
 YF/PVV7/KezgJJyGz4i28zKdbVZvrs8REPOwtGqiGPxvZAYyweRp/6xZM/pIe17qbU1HKelTAFh
 Wr9t40BthOTEq1X8R+LNXdHXHzblBK8vpvMtHMEPWcvDgCnr3if75ESFWUdMRUURNCUO1ou4QUr
 ZUiqcGWRMVaRXBKAwE2R1RDsA2hEzQF7fMINVLBW6w7XwCnd1PRwJDbV0hMZhKUPRYj36sq5we7
 tSzquBv7mJaHocRTYhbg1wIkNJGBA9/mnfvCsGtHrKYZ9jF74KJ/2fOjdsv38axR5HuW5Zv0CCz
 bbLsQXqvS9dnxptHAT25J2Tw==
X-Google-Smtp-Source: AGHT+IEOwlGM2to36S9x5ZnWdy8Iw9QF7hag0UiiX/nJv3YELVBqbSx3bh0EUbNqleZmc9aeVeGuLQ==
X-Received: by 2002:a05:6a21:32a6:b0:35b:ab13:11c5 with SMTP id
 adf61e73a8af0-36150bb9923mr16532698637.0.1764061867640; 
 Tue, 25 Nov 2025 01:11:07 -0800 (PST)
Received: from [10.189.144.225] ([43.224.245.249])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-bd760fafe6dsm15243226a12.34.2025.11.25.01.11.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Nov 2025 01:11:07 -0800 (PST)
Message-ID: <b785e232-28c3-46d8-8d9d-71b73102edd9@gmail.com>
Date: Tue, 25 Nov 2025 17:11:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yangyang Zang <zangyangyang66@gmail.com>, chao@kernel.org,
 jaegeuk@kernel.org
References: <20251125062638.3189156-1-zangyangyang1@xiaomi.com>
Content-Language: en-US, fr-CH
From: Sheng Yong <shengyong2021@gmail.com>
In-Reply-To: <20251125062638.3189156-1-zangyangyang1@xiaomi.com>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/25/25 14:26, Yangyang Zang wrote: > Commit 42482e81248f
 ("resize.f2fs: add caution message for resize") > introduced the `-F' option
 to force resizing f2fs without displaying > the caution messa [...] 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [209.85.210.178 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [shengyong2021(at)gmail.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [shengyong2021(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.178 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vNp4w-0005Uk-AL
Subject: Re: [f2fs-dev] [PATCH v3] resize.f2fs: add -g to give default
 options
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
Cc: shengyong1@xiaomi.com, Yangyang Zang <zangyangyang1@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 11/25/25 14:26, Yangyang Zang wrote:
> Commit 42482e81248f ("resize.f2fs: add caution message for resize")
> introduced the `-F' option to force resizing f2fs without displaying
> the caution message. And `add_default_options()` implies that `-g'
> enables `-F' for resize by default. However resize.f2fs does not
> currently support the `-g' option. This patch adds `-g' for it.
> 
> Fixes: 42482e81248f ("resize.f2fs: add caution message for resize")
> Signed-off-by: Yangyang Zang <zangyangyang1@xiaomi.com>

Reviewed-by: Sheng Yong <shengyong1@xiaomi.com>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
