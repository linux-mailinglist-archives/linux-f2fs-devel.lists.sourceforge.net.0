Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 350292EB66E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  6 Jan 2021 00:45:36 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kww12-00064f-2s; Tue, 05 Jan 2021 23:45:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1kww10-00064W-0K
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 Jan 2021 23:45:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=X+lsGeGZVOdiCcuCKyqZkmsAaN7NfLED4MoSjrB0U1s=; b=JL6nW3LiSlGlVwXFnBtdhr07cT
 baf2dAx5tdb1YdzMGR+vCWq6YvKJqD2vV74TsiUQO+6ztQO+s3WJ2fI+g+4SECoLnktAvBGzjs3ai
 hSwHCRoSVY+N74izxo2ei1mbBDwFl2zWCVupj1ZzupDZ8mtjnxlu/gC80yYEqQ7Gu1FI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=X+lsGeGZVOdiCcuCKyqZkmsAaN7NfLED4MoSjrB0U1s=; b=megvhDxmsGpcJzOkZiIcnwURfU
 iRhC8gOs69Nn+QfbIn84aq24zFCa+f0jHtfzJ3aNUE7jOVcIvJqLKEMubtkOa8+dn/6wMTjoG8rmp
 k+l6/IiE8RwVTL6uH+WRMWOW0qFoY3z/H6HxKwzCSC3M38aotfcBhs4fu02aqIjv8gkQ=;
Received: from mail-lf1-f54.google.com ([209.85.167.54])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kww0s-00CFSl-Gk
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 Jan 2021 23:45:25 +0000
Received: by mail-lf1-f54.google.com with SMTP id l11so2650835lfg.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 05 Jan 2021 15:45:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=X+lsGeGZVOdiCcuCKyqZkmsAaN7NfLED4MoSjrB0U1s=;
 b=kKOaGXJUdAEzBjhbtqV+bOMfPTBDrhqllrk1Rdx/EV28lEPligrl+K83MLWlzYL5/m
 4NSj7Kjr3YFzJ7OV/L+jbcesVQ7id9MoVyA+xgfGt1UtR0G7pxNLfGQVAYVPcK1U25xa
 TU9iSEQGZttY1BZlDuxhnsjDubQJ8bBPVMoKqLZ9lHXQSZzemiIVaexaWlhQp5eBunVa
 3XishtpIagh5xvHHLM5SpIw13QbD64t/TJvu5qzY4QNFa3C8p+WHCZv31y+LxFwTbpuv
 RM1Tebb7+L7Yt7gsK74hP2XVeYN2rUEwEIjuBBUocQ9W0vc7PD1wq79ocYQ0Bu8U+aSQ
 v87A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=X+lsGeGZVOdiCcuCKyqZkmsAaN7NfLED4MoSjrB0U1s=;
 b=Qd/UWHDcZzIF0n4QUxDCH8FBjLgGn6Myl+von+1SArSAefKBQmCMA1d9LDLyS0z0KM
 SOuiFjXeyZJMLfi3T5FuKhx8MEZsBJMnQ9mZY/kSuHMa1MFVWMQ/OYbEbAVNSLuje3SP
 EKK7YZsoNPTk3jCiVpIqDFBIhRyC9vKT8Y5uBvjusD+FDNjW4hbBVgzocalP9nTXudpD
 BJvIeNo2TpXHWQ99fqr4jNFUnHwFC2xDzZwTCRa/FcPqUPh33oHLYxDcyzlvbXDFNj3L
 lAu4dqWVKgqmYOxnoCxMSHu5Sx8f6sPEC+MY8bNHaBzEZZwxkqYIueTyzglHsinRFxL9
 s5dQ==
X-Gm-Message-State: AOAM530YyKnPJGnl+758nG6lIbteI3jtMt0cILB3E5VmQvSZeYV4SjO3
 bPgfL3mVR7f37e5+9nY6z2XHcZ6Tts53k1t8PHM=
X-Google-Smtp-Source: ABdhPJwhxJi7vZ0KT+rMAxScAM8Iih24dkkUHO+FNwsoEjZu/OE+MvgafQWdcMqEBFFJ7MIvyo92w1U2aUynnPy65UQ=
X-Received: by 2002:a2e:a593:: with SMTP id m19mr861832ljp.327.1609890304730; 
 Tue, 05 Jan 2021 15:45:04 -0800 (PST)
MIME-Version: 1.0
References: <20210105041630.1393157-1-daeho43@gmail.com>
 <dba4be04-70dd-d48b-391c-1f2355591097@web.de>
In-Reply-To: <dba4be04-70dd-d48b-391c-1f2355591097@web.de>
From: Daeho Jeong <daeho43@gmail.com>
Date: Wed, 6 Jan 2021 08:44:53 +0900
Message-ID: <CACOAw_xXPZm65BD0SAwFECyEMCD0i_g+7mKyd+=Gtm3p-W19og@mail.gmail.com>
To: Markus Elfring <Markus.Elfring@web.de>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.54 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.54 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kww0s-00CFSl-Gk
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix null page reference in
 redirty_blocks
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Colin Ian King <colin.king@canonical.com>, kernel-team@android.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

R290IGl0fgoKVGhhbmtzLAoKMjAyMeuFhCAx7JuUIDXsnbwgKO2ZlCkg7Jik7ZuEIDk6MDYsIE1h
cmt1cyBFbGZyaW5nIDxNYXJrdXMuRWxmcmluZ0B3ZWIuZGU+64uY7J20IOyekeyEsToKPgo+ID4g
Rml4ZWQgbnVsbCBwYWdlIHJlZmVyZW5jZSB3aGVuIGZpbmRfbG9ja19wYWdlKCkgZmFpbHMgaW4K
PiA+IHJlZGlydHlfYmxvY2tzKCkuCj4KPiBJIHN1Z2dlc3QgdG8gY2hvb3NlIGFuIG90aGVyIGlt
cGVyYXRpdmUgd29yZGluZyBmb3IgdGhpcyBjaGFuZ2UgZGVzY3JpcHRpb24uCj4KPiBTZWUgYWxz
bzoKPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2
YWxkcy9saW51eC5naXQvdHJlZS9Eb2N1bWVudGF0aW9uL3Byb2Nlc3Mvc3VibWl0dGluZy1wYXRj
aGVzLnJzdD9pZD0zNmJiYmQwZTIzNGQ4MTc5MzhiZGM1MjEyMWEwZjU0NzNiM2U1OGY1I244OQo+
Cj4KPiA+IHYyOiBjaGFuZ2VkIGVycm9yIHZhbHVlIGFuZCBicmVhayB0aGUgbG9vcCB3aGVuIGVy
cm9yIG9jY3Vycwo+Cj4gSSBwcm9wb3NlIHRvIHVzZSBhIHJldHVybiBzdGF0ZW1lbnQgaW5zdGVh
ZCBvZiBhIGJyZWFrIGluIHRoZSBzZWNvbmQgaWYgYnJhbmNoCj4gZm9yIHRoaXMgZnVuY3Rpb24g
aW1wbGVtZW50YXRpb24uCj4KPiBTZWUgYWxzbzoKPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1
Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvdHJlZS9Eb2N1bWVudGF0
aW9uL3Byb2Nlc3MvY29kaW5nLXN0eWxlLnJzdD9pZD0zNmJiYmQwZTIzNGQ4MTc5MzhiZGM1MjEy
MWEwZjU0NzNiM2U1OGY1I240ODEKPgo+IFJlZ2FyZHMsCj4gTWFya3VzCj4KPgo+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gTGludXgtZjJmcy1kZXZl
bCBtYWlsaW5nIGxpc3QKPiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+
IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMt
ZGV2ZWwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJj
ZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9s
aW51eC1mMmZzLWRldmVsCg==
