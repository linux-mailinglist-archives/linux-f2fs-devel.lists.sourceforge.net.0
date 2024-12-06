Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1AA9E63ED
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  6 Dec 2024 03:16:12 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tJNsv-00041s-QL;
	Fri, 06 Dec 2024 02:16:01 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <panglu2022@gmail.com>) id 1tJNsu-00041m-58
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 06 Dec 2024 02:15:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QWODGdNLpaKNDDGg75lrjm+Dj4pG5EtF0DxLL8JtD8M=; b=lawkkM6CuM3yBCSnUiGq+tobz+
 vIIs8r2OVfbg5O7vlV6G7VeClGUSQ10zrZW4BqIBpthk8o386ws4yEfJaQM4fUY+89E9KpSKv1qiF
 zJABrIt+PLIUe906WBnm9BZ6EB5zZcC+mbK1JDwxWVRk0AfO+eB4Nwvzw/Cl11UZqh3U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QWODGdNLpaKNDDGg75lrjm+Dj4pG5EtF0DxLL8JtD8M=; b=ivBRreoux0TuhVxaHSyPOPoqUj
 /5I9Iek1m4ryGsveT+ARZFaIpvchbxgc8iE2EVEE7n7+I2FuqL+D3hf3jTrFmw3s58h8rfqG1IswD
 QZ0bRAaV87HpgMPuRzMVcFrYx6BM0vVn6aOtnYq1NuOLmTc+YZ/vgmmTkwdoVZC4gnEs=;
Received: from mail-vk1-f182.google.com ([209.85.221.182])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tJNss-0005hu-U7 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 06 Dec 2024 02:15:59 +0000
Received: by mail-vk1-f182.google.com with SMTP id
 71dfb90a1353d-51533f41ce1so473111e0c.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 05 Dec 2024 18:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733451348; x=1734056148; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QWODGdNLpaKNDDGg75lrjm+Dj4pG5EtF0DxLL8JtD8M=;
 b=G1bDvoS79jvGO4vHyz5hF5OZUNtCFrFIEc4yS6Poa8PF/uJC2LQ6dlkBCvBWPRtXm4
 EKzw2w01AB+bgb0Akm8QYWrrnZ5/V/b13WfTIcRH+zyRkYNewYYBxov4ix3WTMj9gVh/
 5T/67uKkqnWY7vRlfpwHSQw6HZKZxReCuwpNMlq123HGiSY/cmrlU1Ng0Cjr40dUICo7
 v6C4Yp7eyXFHVjOdEiOoIo7tmfhJNDHMyvZfUE7M63MzFhhfJt2M5Q4oM/42LdFSN0k8
 LxkxHYi9hWBU2akTOn61Qv5APDDslbhKvzuk5NyocZ8x0yUncPcP1aIrPiBPgjI3vROr
 WWiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733451348; x=1734056148;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QWODGdNLpaKNDDGg75lrjm+Dj4pG5EtF0DxLL8JtD8M=;
 b=vozDcelxnUPKfIHZsSkqeeSfsQYAIlbfJFh0f+ST3dYcCdpvqh0YvEDCum3k/AbUNr
 9tH3S/NBE7r9O42hRlY/1hwDbg8+2gJJLoGql5KBwaKDp7JF+qROUmXNBM2viNKgrnmD
 IQp9BuzxLOJkbrS/CHUIT7dI2gmBuHMCfU0yQXJBwEk7IufTn/OlZoLGtn75bZ2HPg0e
 DXAgYNecgplQZQuwC0+t5gvN6NT54n1IfywOoPs/zFX7X1006aKbOtdypHCGID6nqAdj
 CHWLkwReFsxJEbBokShNIaaIIFAo0C2DGsDc4W0fw+CuEV9gdkPK3XUPIbxAJ7AwXILX
 QR8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIiRVmgJTbtNxVmID240gexO4V1KUml+AKKRbP+C3ce9QXPA3Qizj7WbhUzjiKsp9Qv3TUawqHkmTHAQBXoUZZ@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzTjmoNjFvz5hVgIp4lQpdgDBAIUDNROCpUCiFAaOPz6V5ruYgI
 uLc++US2GmQmHmMXbglx2tiLYL8Zzdpcwh8oGtRs8XKZ8B/BwlocInf8UZeFK96Qb/Q/LoD2n9r
 MRN8ggrZt/AylBlo8RFByweGV2nc=
X-Gm-Gg: ASbGnctx7CMB363UbsG0ZiePYwWDh0xRvMERIBbRWx9GEb2a2BPrepSKJXAqoKQ2BsU
 uk/pb7L6aMBNgvgrmhEFyzrHpr7MWZBo4
X-Google-Smtp-Source: AGHT+IGQwQIQNfk4KF2XCk3C0vaj6epk3J9YB74Tnscs6BeRdGI06u2PHZORouPSxjnQuE4QmY1Ve1NVv6ivIfCy9hc=
X-Received: by 2002:a05:6122:50a:b0:510:3a9:bb87 with SMTP id
 71dfb90a1353d-515fca07ce8mr2052536e0c.1.1733451347981; Thu, 05 Dec 2024
 18:15:47 -0800 (PST)
MIME-Version: 1.0
References: <20241205080109.43552-1-panglu2022@gmail.com>
 <7ba0f67f-20bc-4097-9372-7feb45a6cefb@oppo.com>
In-Reply-To: <7ba0f67f-20bc-4097-9372-7feb45a6cefb@oppo.com>
From: Lu Pang <panglu2022@gmail.com>
Date: Fri, 6 Dec 2024 10:15:37 +0800
Message-ID: <CAOcz8Buo29gGg3bSyDn1MCeAY7qR1UHy5e0zZ+Pv41Weery6+Q@mail.gmail.com>
To: Sheng Yong <shengyong@oppo.com>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Thu, Dec 5, 2024 at 8:00 PM Sheng Yong wrote: > It seems
    that both pread and pwrite are not available on windows. However, > (I think)
    windows targets are needed for Windows Android SDK. Hi, Sh [...] 
 
 Content analysis details:   (0.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [panglu2022[at]gmail.com]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [panglu2022[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.221.182 listed in sa-accredit.habeas.com]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                            [209.85.221.182 listed in bl.score.senderscore.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.221.182 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.182 listed in wl.mailspike.net]
X-Headers-End: 1tJNss-0005hu-U7
Subject: Re: [f2fs-dev] [PATCH] libf2fs_io: change lseek & read/write to
 pread/pwrite
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVGh1LCBEZWMgNSwgMjAyNCBhdCA4OjAw4oCvUE0gU2hlbmcgWW9uZyA8c2hlbmd5b25nQG9w
cG8uY29tPiB3cm90ZToKPiBJdCBzZWVtcyB0aGF0IGJvdGggcHJlYWQgYW5kIHB3cml0ZSBhcmUg
bm90IGF2YWlsYWJsZSBvbiB3aW5kb3dzLiBIb3dldmVyLAo+IChJIHRoaW5rKSB3aW5kb3dzIHRh
cmdldHMgYXJlIG5lZWRlZCBmb3IgV2luZG93cyBBbmRyb2lkIFNESy4KSGksIFNoZW5nIFlvbmcs
CgpZb3UgYXJlIHJpZ2h0LiBJIGZvcmdvdCB0byBjb25zaWRlciBXaW5kb3dzLgpJcyB0aGVyZSBh
bnkgZXF1aXZhbGVudCBmb3JtIG9mIHByZWFkIGFuZCBwd3JpdGUgb24gV2luZG93cz8KClRoYW5r
cywKTHUgUGFuZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMu
c291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3Rp
bmZvL2xpbnV4LWYyZnMtZGV2ZWwK
