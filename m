Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 243C28C8F21
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 18 May 2024 03:25:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s88p9-0008Lm-F1;
	Sat, 18 May 2024 01:25:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <groeck7@gmail.com>) id 1s88p8-0008Lc-ET;
 Sat, 18 May 2024 01:25:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cJqjedwoYcqSzJKmZSEwT+6hVhtxWLfg/8QtauvSdx4=; b=Gv5urcYHMXGSmuUxxugmwACeFN
 QedADx0GR7hONPNOp5JNC+ZLOJXP/49KewVDd/gaHph2UipCjvrAEjx4ctWp7IxlwaX6BB4yAxB2c
 94+fiBotgP64rZaLfEBZ8lEgTu8BmjH4qNO4pRJrfBZUgrDzXJhNW/ejxqu90kAjXQuw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:From:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cJqjedwoYcqSzJKmZSEwT+6hVhtxWLfg/8QtauvSdx4=; b=VA442bRu9ILrhqZ2hDSojiOosZ
 1dElGJcrPgssCjXAWjsXzWdoG7mV5htcC9QG492FasSPcnk/VO5sAW4lH8knk6D1h5S2/UZbdt0F7
 EvEnEb0vxQ9DQO7SaRjjB2AaKF/FZUq4FGOCRSr8ra2aqHSxaC0tT2ThOIgHMDqo3rFY=;
Received: from mail-oo1-f50.google.com ([209.85.161.50])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1s88p8-0007oZ-Ea; Sat, 18 May 2024 01:25:22 +0000
Received: by mail-oo1-f50.google.com with SMTP id
 006d021491bc7-5b31f2c6e52so395318eaf.2; 
 Fri, 17 May 2024 18:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715995511; x=1716600311; darn=lists.sourceforge.net;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=cJqjedwoYcqSzJKmZSEwT+6hVhtxWLfg/8QtauvSdx4=;
 b=lIQhOEAvV9r6NAgcsrc8fU3/sqX7KxGlpFvMBxBmbS41ksoR6x7gwsROros0kX7CDG
 3DGDWUN7WLsAlN1F7FLQUptCsAowCy6weBr08MLny/+EmggewVYPpmyWLqbPaG0ym9KR
 7z0btwkLv5wkeAwivCEcSg8h8rimE1WfhdddGQNd03ALeEgWsTcNzG1zwvSW+goYCRT1
 IPfHFrXhY7fhMxo3PP5l9uMEc3Le6LkWnhV98itvtenWFGfGq+94yqC9fvcRzpKz7A7O
 tiC6fb+liuaEx3sr95f9lXGPoUm7+ANES4fRsqh5degRV+hVxuwH4C7sJ1a8IK+CyFfA
 5p0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715995511; x=1716600311;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cJqjedwoYcqSzJKmZSEwT+6hVhtxWLfg/8QtauvSdx4=;
 b=Np2voKvSqVKViZ7YJwn0fCrXzlP8xPerZ0MPtzn/pgj0Z1CMPocK4aKT/YoA3uqnMr
 RhPOmkssyNqjDKbyC3mkWM8XZciD3c9wibxX7Itfz4XMWm0sxqPy/VedT6ZjfAvkPvB2
 TDTXWd4O8PZi3n1UIQ2ZzOCQR4q8lJ68/v6ulKdgrIu67BsswhYl7gsMwG6Ils4+Sak3
 UxKTJClfNyRgCh2+pnsg+5T4Z1PFRlV5pRm1HfGVC1RxXHy5tDehZUo8khZAcbv4O+78
 5yz18DZRoAEA4hqk+knThPl5EPHfc3q3gFiaQIv2V4H7DTwSLvVsKQo48pr679MPU7tg
 pYvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXElbjU+0gyGUZS+y9pAjYhA28CDTwAlc/XB2mnxZ6LBSJ9gYlfwAnfWwFnPHXK9pDp2+luBciuoXp5kmYOzvrV19/0XHTnh+fxfyao0zbpTZqgsg/6KCwGiPU/323us8R5S7A/tV1LuEVhig+Y+IylfO3TscFfEVGCu5O1qQ==
X-Gm-Message-State: AOJu0Yz23fmUvZPjqpXg35hLD4HofWiLZay7u9R1ESL+BWWWOx6XJKOl
 l/hactgwPuL/YD9UV/4wfR3dysGbQGOIHUP7GXfO8m1Q3Awybqs1
X-Google-Smtp-Source: AGHT+IFRaG5+veBhAS+2oO1Mq9a7mnKgK9vX9unu3cCbE/KbyDzrBjSt084GN8tso2cWg108BqN4VA==
X-Received: by 2002:a05:6870:a3d2:b0:240:c8ff:c96a with SMTP id
 586e51a60fabf-241728fc1damr27553351fac.27.1715995510785; 
 Fri, 17 May 2024 18:25:10 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f4d2a66316sm15339938b3a.35.2024.05.17.18.25.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 May 2024 18:25:09 -0700 (PDT)
Message-ID: <64db2b94-edb3-4ea3-87cf-bb91746869e6@roeck-us.net>
Date: Fri, 17 May 2024 18:25:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Guenter Roeck <linux@roeck-us.net>
To: Steven Rostedt <rostedt@goodmis.org>
References: <20240516133454.681ba6a0@rorschach.local.home>
 <5080f4c5-e0b3-4c2e-9732-f673d7e6ca66@roeck-us.net>
 <20240517134834.43e726dd@gandalf.local.home>
 <5cff0ff0-48d1-49f8-84f4-bb33571fdf16@roeck-us.net>
Content-Language: en-US
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <5cff0ff0-48d1-49f8-84f4-bb33571fdf16@roeck-us.net>
X-Spam-Score: -4.6 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 5/17/24 11:00, Guenter Roeck wrote: > On 5/17/24 10:48,
 Steven Rostedt wrote: >> On Fri, 17 May 2024 10:36:37 -0700 >> Guenter Roeck
 <linux@roeck-us.net> wrote: >> >>> Building csky:allmodconfig (a [...] 
 Content analysis details:   (-4.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.85.161.50 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.161.50 listed in wl.mailspike.net]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [groeck7[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [groeck7[at]gmail.com]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
 EnvelopeFrom freemail headers are different
X-Headers-End: 1s88p8-0007oZ-Ea
Subject: Re: [f2fs-dev] [PATCH] tracing/treewide: Remove second parameter of
 __assign_str()
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
Cc: linux-hyperv@vger.kernel.org, linux-usb@vger.kernel.org,
 kvm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 brcm80211@lists.linux.dev, ath10k@lists.infradead.org,
 Julia Lawall <Julia.Lawall@inria.fr>, linux-s390@vger.kernel.org,
 dev@openvswitch.org, linux-cifs@vger.kernel.org, linux-rdma@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, io-uring@vger.kernel.org,
 linux-bcachefs@vger.kernel.org, iommu@lists.linux.dev,
 ath11k@lists.infradead.org, linux-media@vger.kernel.org,
 linux-wpan@vger.kernel.org, linux-pm@vger.kernel.org, selinux@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-erofs@lists.ozlabs.org, virtualization@lists.linux.dev,
 linux-sound@vger.kernel.org, linux-block@vger.kernel.org,
 ocfs2-devel@lists.linux.dev,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, linux-cxl@vger.kernel.org,
 linux-tegra@vger.kernel.org, intel-xe@lists.freedesktop.org,
 linux-edac@vger.kernel.org, linux-hwmon@vger.kernel.org,
 brcm80211-dev-list.pdl@broadcom.com,
 Linus Torvalds <torvalds@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 linux-wireless@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 ath12k@lists.infradead.org, tipc-discussion@lists.sourceforge.net,
 Masami Hiramatsu <mhiramat@kernel.org>, netdev@vger.kernel.org,
 bpf@vger.kernel.org, Linux trace kernel <linux-trace-kernel@vger.kernel.org>,
 freedreno@lists.freedesktop.org, linux-nfs@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gNS8xNy8yNCAxMTowMCwgR3VlbnRlciBSb2VjayB3cm90ZToKPiBPbiA1LzE3LzI0IDEwOjQ4
LCBTdGV2ZW4gUm9zdGVkdCB3cm90ZToKPj4gT24gRnJpLCAxNyBNYXkgMjAyNCAxMDozNjozNyAt
MDcwMAo+PiBHdWVudGVyIFJvZWNrIDxsaW51eEByb2Vjay11cy5uZXQ+IHdyb3RlOgo+Pgo+Pj4g
QnVpbGRpbmcgY3NreTphbGxtb2Rjb25maWcgKGFuZCBvdGhlcnMpIC4uLiBmYWlsZWQKPj4+IC0t
LS0tLS0tLS0tLS0tCj4+PiBFcnJvciBsb2c6Cj4+PiBJbiBmaWxlIGluY2x1ZGVkIGZyb20gaW5j
bHVkZS90cmFjZS90cmFjZV9ldmVudHMuaDo0MTksCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGZyb20gaW5jbHVkZS90cmFjZS9kZWZpbmVfdHJhY2UuaDoxMDIsCj4+PiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZyb20gZHJpdmVycy9jeGwvY29yZS90
cmFjZS5oOjczNywKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZnJvbSBk
cml2ZXJzL2N4bC9jb3JlL3RyYWNlLmM6ODoKPj4+IGRyaXZlcnMvY3hsL2NvcmUvLi90cmFjZS5o
OjM4MzoxOiBlcnJvcjogbWFjcm8gIl9fYXNzaWduX3N0ciIgcGFzc2VkIDIgYXJndW1lbnRzLCBi
dXQgdGFrZXMganVzdCAxCj4+Pgo+Pj4gVGhpcyBpcyB3aXRoIHRoZSBwYXRjaCBhcHBsaWVkIG9u
IHRvcCBvZiB2Ni45LTg0MTAtZ2ZmMjYzMmQ3ZDA4ZS4KPj4+IFNvIGZhciB0aGF0IHNlZW1zIHRv
IGJlIHRoZSBvbmx5IGJ1aWxkIGZhaWx1cmUuCj4+PiBJbnRyb2R1Y2VkIHdpdGggY29tbWl0IDZh
ZWMwMDEzOWQzYTggKCJjeGwvY29yZTogQWRkIHJlZ2lvbiBpbmZvIHRvCj4+PiBjeGxfZ2VuZXJh
bF9tZWRpYSBhbmQgY3hsX2RyYW0gZXZlbnRzIikuIEd1ZXNzIHdlJ2xsIHNlZSBtb3JlIG9mIHRo
b3NlCj4+PiB0b3dhcmRzIHRoZSBlbmQgb2YgdGhlIGNvbW1pdCB3aW5kb3cuCj4+Cj4+IExvb2tz
IGxpa2UgSSBtYWRlIHRoaXMgcGF0Y2gganVzdCBiZWZvcmUgdGhpcyBjb21taXQgd2FzIHB1bGxl
ZCBpbnRvCj4+IExpbnVzJ3MgdHJlZS4KPj4KPj4gV2hpY2ggaXMgd2h5IEknbGwgYXBwbHkgYW5k
IHJlcnVuIHRoZSBhYm92ZSBhZ2FpbiBwcm9iYWJseSBvbiBUdWVzZGF5IG9mCj4+IG5leHQgd2Vl
ayBhZ2FpbnN0IExpbnVzJ3MgbGF0ZXN0Lgo+Pgo+PiBUaGlzIHBhdGNoIG1hZGUgaXQgdGhyb3Vn
aCBib3RoIGFuIGFsbHllc2NvbmZpZyBhbmQgYW4gYWxsbW9kY29uZmlnLCBidXQgb24KPj4gdGhl
IGNvbW1pdCBJIGhhZCBhcHBsaWVkIGl0IHRvLCB3aGljaCB3YXM6Cj4+Cj4+IMKgwqAgMWIyOTRh
MWYzNTYxICgiTWVyZ2UgdGFnICduZXQtbmV4dC02LjEwJyBvZiBnaXQ6Ly9naXQua2VybmVsLm9y
Zy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbmV0ZGV2L25ldC1uZXh0IikKPj4KPj4gSSdsbCBi
ZSBjb21waWxpbmcgdGhvc2UgdHdvIGJ1aWxkcyBhZnRlciBJIHVwZGF0ZSBpdCB0aGVuLgo+Pgo+
IAo+IEkgYW0gY3VycmVudGx5IHJlcGVhdGluZyBteSB0ZXN0IGJ1aWxkcyB3aXRoIHRoZSBhYm92
ZSBlcnJvcnMgZml4ZWQuCj4gVGhhdCBzaG91bGQgdGFrZSBhIGNvdXBsZSBvZiBob3Vycy4gSSds
bCBsZXQgeW91IGtub3cgaG93IGl0IGdvZXMuCj4gCgpUaGVyZSBhcmUgbm8gbW9yZSBidWlsZCBm
YWlsdXJlcyBjYXVzZWQgYnkgdGhpcyBwYXRjaCBhZnRlciBmaXhpbmcgdGhlIGFib3ZlCmVycm9y
cy4KClRlc3RlZC1ieTogR3VlbnRlciBSb2VjayA8bGludXhAcm9lY2stdXMubmV0PgoKR3VlbnRl
cgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZv
cmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51
eC1mMmZzLWRldmVsCg==
