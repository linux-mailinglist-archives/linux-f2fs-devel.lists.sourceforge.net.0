Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CGj2B12E5WkdkwEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 20 Apr 2026 03:41:49 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E7B42609D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 20 Apr 2026 03:41:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:References:To:From:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cc+8oY0dq/A95gGhfvHDTEIIktDO2bI94Gkxv9y4b+k=; b=k1wJkBEDhtMKHv/rsbt24i94yW
	ELnDCHvvtAz8aSARH+AjHGvWd4Be6cNhYEcSB+zbl7ek+X0UcqPyth81Co5J0qhACviTT3s0usjH+
	MwS1oaZfUl5n4Q2nNCjLk9cY5Wj3FbCexYFW9mgvrT6kFoQADI6FtsNBWp3EWFRL5ACQ=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wEddn-0004hj-RN;
	Mon, 20 Apr 2026 01:41:36 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ruipengqi3@gmail.com>) id 1wEddl-0004hS-SY
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 20 Apr 2026 01:41:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Cc:To:Subject:From:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wdlhCJyNP6uETW2T3gVyDMyYByBkuzxax7waVBvXPPU=; b=CkjSHXWT1C2WqIT2wJqSRg2BAS
 D/CwZLgVEbya2e5K8KzNCCqVRQypOtPxtd27xv3A2mosk3j3pbvLZKNOi9t7RJkQtPgBOpMAYtg6d
 5I9RPuBHYxvbe2OKYBA9NTznMuKRLkrB3OzaNbiT+6c19aug+aMdKqHXyBQ5P7cRxC+w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:
 Subject:From:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wdlhCJyNP6uETW2T3gVyDMyYByBkuzxax7waVBvXPPU=; b=bPaTaRc2q4kiQpN4bAHv/5zifa
 oU0OUTzjTZJyiGcQpQRSODieJBzQrSAAAh/IhP2O4kNqGqkX8SMUyT/9JE8zxtazFXdDusF3GyJZ/
 BFi7Vlnh/aJMLMLvdATv/WTTIgD6iqJ7+D9dzzBlfB+wyBTuic3BCTvRip9mYS1f0gQI=;
Received: from mail-pl1-f171.google.com ([209.85.214.171])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wEddm-0003t5-1M for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 20 Apr 2026 01:41:34 +0000
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-2b2494440f3so7663415ad.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 19 Apr 2026 18:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776649283; x=1777254083; darn=lists.sourceforge.net;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=wdlhCJyNP6uETW2T3gVyDMyYByBkuzxax7waVBvXPPU=;
 b=PNSfB7jY71RzCXoUdLmmuorg6iAdjhysA/N6D/F3iyXROCTiz4IgWU3Z85/YF2gobx
 tNZiLEH93FhWWPb9Mz/Ki3sI03OQ6NFIs4ibTr6TEJfeTr377gDDhDxABtkyccb3hOop
 AyAzZ7/ela4Xw2O0V1scXxR2ihoMUMO7tTAQBDTAcj3J79GNQU95PqOOWNrjdUKm8dwg
 8tx9qlBGWm0op/KW/w257UvwTNjsYOOjL/sDHvwnGyI+0waJfVlTprx6zhAde+xnDE8a
 AoHrT85R0uRh1cXeOB+CyPGFhZVeYyeqOgIeCkrf2MV/3vN9QRqj/Nwa8Kar3FCBMAKB
 bdOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776649283; x=1777254083;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wdlhCJyNP6uETW2T3gVyDMyYByBkuzxax7waVBvXPPU=;
 b=liaL4g3+l0P3e+MCg1km+c7n6vCmXUel/60dSaaC7mglWmarsiwfgIfGU3BoxQrOTj
 RaGm7xXIgGxMtps0X9Atv6VKtlbXEH1+fMzUUww9fSAIbXSeJVVGjET9eeAx0d4KHfIj
 bYuddOOWX74R0VmJSliMt1PXCJHpDwpfToJgIzMze2okyzV1/CCP/9AW1Yk3RNvPj662
 5a2Lj0hd+Jv4tLBlSZofvHkvGaHftG2zsZNXVL2H5zsu+0nAwiUEKi4T/OXJoN4zoNdS
 2PCOWNjkvPKjzVTKbQmQpN+lS+AgVahgmBVNmK2zgK0dwlB+/Wvg5hBbuVfJntqDdJvr
 mp+Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ9BAfyw3XNnOQ+FHJWxhv2BeHTCp5rSlX4tsev2NkQcW/LK7UJ0nI2bXy3WixGICSzg8soMrxzgS7WnLvF9lnym@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyfL226p52ZPKjih7+ziGl9cazbL4SU85CWUv2qD1lO7KM1WGkK
 VXJCRxZ+G2fZXKIEjK5d0zOE+w6tx48G8aRZJiBrkJAb8usIEVoFnUtZ
X-Gm-Gg: AeBDietrpom+e7+AvpM7vJWRpvvOPO6BkceSHotjCS0PvK9G2yGh9MsUgYyhXiaPZbM
 5ilh9Z54qjL+cHk6uFXry2flnp7kavpiJbZVQbi/n//VU0PTZwx/V9Z7kIuwptp4CRYxrqah2Ix
 fUtEFM+YIl0bgUcUempAQNPFwv2xHyP/8uvhFIiZUq8GGIwLlTIULXf6lThNhPX61g9PEKT5raM
 EcVLywMWwckn8SXZUkCpQKNesJMLhRUMkqRDsmeSFvGiQb7pva1g6W4zHPj5/0vnozu5uuuYdax
 85x2ZuPjkeenzWwxWg6JLepEW90nTXbqSnfXQp/vko+ee3Zc2zFrCMv4hyQ+vUzH91LNbIyviA3
 hTSQEtTptFNm+lZVVB5Xvp6p/0kgs0qhAvRgszWshXtBGT+r36WTJvdF8QJwyQRcNkmPXgaxSk1
 tEyjjysGEDHpyuuQk4HGnjLSAUA5VVlwl22L8CuFP5nsS4pvIW
X-Received: by 2002:a17:902:bd85:b0:2b4:5e0f:c239 with SMTP id
 d9443c01a7336-2b5f9eaa80bmr74815805ad.10.1776649283232; 
 Sun, 19 Apr 2026 18:41:23 -0700 (PDT)
Received: from [10.121.80.58] ([210.184.73.204])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b5fab29398sm86217945ad.66.2026.04.19.18.41.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Apr 2026 18:41:22 -0700 (PDT)
Message-ID: <6903fe2d-ce67-4e9b-a5bc-d71da50450d5@gmail.com>
Date: Mon, 20 Apr 2026 09:41:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Ruipeng Qi <ruipengqi3@gmail.com>
To: jaegeuk@kernel.org
References: <20260325133749.1053541-1-ruipengqi3@gmail.com>
Content-Language: en-US
In-Reply-To: <20260325133749.1053541-1-ruipengqi3@gmail.com>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2026/3/25 21:37, ruipengqi wrote: > From: Ruipeng Qi >
 > When the f2fs filesystem space is nearly exhausted, we encounter deadlock
 > issues as below: > > INFO: task A:1890 blocked for more than 1 [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [ruipengqi3(at)gmail.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [ruipengqi3(at)gmail.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.214.171 listed in wl.mailspike.net]
X-Headers-End: 1wEddm-0003t5-1M
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix potential deadlock in
 f2fs_balance_fs()
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-0.91 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[ruipengqi3@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ruipengqi3@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns]
X-Rspamd-Queue-Id: 10E7B42609D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Ck9uIDIwMjYvMy8yNSAyMTozNywgcnVpcGVuZ3FpIHdyb3RlOgo+IEZyb206IFJ1aXBlbmcgUWk8
cnVpcGVuZ3FpM0BnbWFpbC5jb20+Cj4KPiBXaGVuIHRoZSBmMmZzIGZpbGVzeXN0ZW0gc3BhY2Ug
aXMgbmVhcmx5IGV4aGF1c3RlZCwgd2UgZW5jb3VudGVyIGRlYWRsb2NrCj4gaXNzdWVzIGFzIGJl
bG93Ogo+Cj4gSU5GTzogdGFzayBBOjE4OTAgYmxvY2tlZCBmb3IgbW9yZSB0aGFuIDEyMCBzZWNv
bmRzLgo+ICAgICAgICBUYWludGVkOiBHICAgICAgICAgICBPICAgICAgIDYuMTIuNDEtZzNmZTA3
ZGRmMDVhYiAjMQo+ICJlY2hvIDAgPiAvcHJvYy9zeXMva2VybmVsL2h1bmdfdGFza190aW1lb3V0
X3NlY3MiIGRpc2FibGVzIHRoaXMgbWVzc2FnZS4KPiB0YXNrOkEgICAgc3RhdGU6RCBzdGFjazow
ICAgICBwaWQ6MTg5MCAgdGdpZDoxNjI2ICBwcGlkOjExNTMgICBmbGFnczoweDAwMDAwMjA0Cj4g
Q2FsbCB0cmFjZToKPiAgIF9fc3dpdGNoX3RvKzB4ZjQvMHgxNTgKPiAgIF9fc2NoZWR1bGUrMHgy
N2MvMHg5MDgKPiAgIHNjaGVkdWxlKzB4M2MvMHgxMTgKPiAgIGlvX3NjaGVkdWxlKzB4NDQvMHg2
OAo+ICAgZm9saW9fd2FpdF9iaXRfY29tbW9uKzB4MTc0LzB4MzcwCj4gICBmb2xpb193YWl0X2Jp
dCsweDIwLzB4MzgKPiAgIGZvbGlvX3dhaXRfd3JpdGViYWNrKzB4NTQvMHhjOAo+ICAgdHJ1bmNh
dGVfaW5vZGVfcGFydGlhbF9mb2xpbysweDcwLzB4MWUwCj4gICB0cnVuY2F0ZV9pbm9kZV9wYWdl
c19yYW5nZSsweDFiMC8weDQ1MAo+ICAgdHJ1bmNhdGVfcGFnZWNhY2hlKzB4NTQvMHg4OAo+ICAg
ZjJmc19maWxlX3dyaXRlX2l0ZXIrMHgzZTgvMHhiODAKPiAgIGRvX2l0ZXJfcmVhZHZfd3JpdGV2
KzB4ZjAvMHgxZTAKPiAgIHZmc193cml0ZXYrMHgxMzgvMHgyYzgKPiAgIGRvX3dyaXRldisweDg4
LzB4MTMwCj4gICBfX2FybTY0X3N5c193cml0ZXYrMHgyOC8weDQwCj4gICBpbnZva2Vfc3lzY2Fs
bCsweDUwLzB4MTIwCj4gICBlbDBfc3ZjX2NvbW1vbi5jb25zdHByb3AuMCsweGM4LzB4ZjAKPiAg
IGRvX2VsMF9zdmMrMHgyNC8weDM4Cj4gICBlbDBfc3ZjKzB4MzAvMHhmOAo+ICAgZWwwdF82NF9z
eW5jX2hhbmRsZXIrMHgxMjAvMHgxMzAKPiAgIGVsMHRfNjRfc3luYysweDE5MC8weDE5OAo+Cj4g
SU5GTzogdGFzayBrd29ya2VyL3U4OjExOjI2ODA4NTMgYmxvY2tlZCBmb3IgbW9yZSB0aGFuIDEy
MCBzZWNvbmRzLgo+ICAgICAgICBUYWludGVkOiBHICAgICAgICAgICBPICAgICAgIDYuMTIuNDEt
ZzNmZTA3ZGRmMDVhYiAjMQo+ICJlY2hvIDAgPiAvcHJvYy9zeXMva2VybmVsL2h1bmdfdGFza190
aW1lb3V0X3NlY3MiIGRpc2FibGVzIHRoaXMgbWVzc2FnZS4KPiB0YXNrOmt3b3JrZXIvdTg6MTEg
ICBzdGF0ZTpEIHN0YWNrOjAgICAgIHBpZDoyNjgwODUzIHRnaWQ6MjY4MDg1MyBwcGlkOjIgICAg
ICBmbGFnczoweDAwMDAwMjA4Cj4gV29ya3F1ZXVlOiB3cml0ZWJhY2sgd2Jfd29ya2ZuIChmbHVz
aC0yNTQ6MCkKPiBDYWxsIHRyYWNlOgo+ICAgX19zd2l0Y2hfdG8rMHhmNC8weDE1OAo+ICAgX19z
Y2hlZHVsZSsweDI3Yy8weDkwOAo+ICAgc2NoZWR1bGUrMHgzYy8weDExOAo+ICAgaW9fc2NoZWR1
bGUrMHg0NC8weDY4Cj4gICBmb2xpb193YWl0X2JpdF9jb21tb24rMHgxNzQvMHgzNzAKPiAgIF9f
ZmlsZW1hcF9nZXRfZm9saW8rMHgyMTQvMHgzNDgKPiAgIHBhZ2VjYWNoZV9nZXRfcGFnZSsweDIw
LzB4NzAKPiAgIGYyZnNfZ2V0X3JlYWRfZGF0YV9wYWdlKzB4MTUwLzB4M2U4Cj4gICBmMmZzX2dl
dF9sb2NrX2RhdGFfcGFnZSsweDJjLzB4MTYwCj4gICBtb3ZlX2RhdGFfcGFnZSsweDUwLzB4NDc4
Cj4gICBkb19nYXJiYWdlX2NvbGxlY3QrMHhkMzgvMHgxNTI4Cj4gICBmMmZzX2djKzB4MjQwLzB4
N2UwCj4gICBmMmZzX2JhbGFuY2VfZnMrMHgxYTAvMHgyMDgKPiAgIGYyZnNfd3JpdGVfc2luZ2xl
X2RhdGFfcGFnZSsweDZlNC8weDczMCAgLy8weGZmZmZmZTBkNmNhMDgzMDAKPiAgIGYyZnNfd3Jp
dGVfY2FjaGVfcGFnZXMrMHgzNzgvMHg5YjAKPiAgIGYyZnNfd3JpdGVfZGF0YV9wYWdlcysweDJl
NC8weDM4OAo+ICAgZG9fd3JpdGVwYWdlcysweDhjLzB4MmM4Cj4gICBfX3dyaXRlYmFja19zaW5n
bGVfaW5vZGUrMHg0Yy8weDQ5OAo+ICAgd3JpdGViYWNrX3NiX2lub2RlcysweDIzNC8weDRhOAo+
ICAgX193cml0ZWJhY2tfaW5vZGVzX3diKzB4NTgvMHgxMTgKPiAgIHdiX3dyaXRlYmFjaysweDJm
OC8weDNjMAo+ICAgd2Jfd29ya2ZuKzB4MmM0LzB4NTA4Cj4gICBwcm9jZXNzX29uZV93b3JrKzB4
MTgwLzB4NDA4Cj4gICB3b3JrZXJfdGhyZWFkKzB4MjU4LzB4MzY4Cj4gICBrdGhyZWFkKzB4MTE4
LzB4MTI4Cj4gICByZXRfZnJvbV9mb3JrKzB4MTAvMHgyMDAKPgo+IElORk86IHRhc2sga3dvcmtl
ci91ODo4OjI2NDEyOTcgYmxvY2tlZCBmb3IgbW9yZSB0aGFuIDEyMCBzZWNvbmRzLgo+ICAgICAg
ICBUYWludGVkOiBHICAgICAgICAgICBPICAgICAgIDYuMTIuNDEtZzNmZTA3ZGRmMDVhYiAjMQo+
ICJlY2hvIDAgPiAvcHJvYy9zeXMva2VybmVsL2h1bmdfdGFza190aW1lb3V0X3NlY3MiIGRpc2Fi
bGVzIHRoaXMgbWVzc2FnZS4KPiB0YXNrOmt3b3JrZXIvdTg6OCAgICBzdGF0ZTpEIHN0YWNrOjAg
ICAgIHBpZDoyNjQxMjk3IHRnaWQ6MjY0MTI5NyBwcGlkOjIgICAgICBmbGFnczoweDAwMDAwMjA4
Cj4gV29ya3F1ZXVlOiB3cml0ZWJhY2sgd2Jfd29ya2ZuIChmbHVzaC0yNTQ6MCkKPiBDYWxsIHRy
YWNlOgo+ICAgX19zd2l0Y2hfdG8rMHhmNC8weDE1OAo+ICAgX19zY2hlZHVsZSsweDI3Yy8weDkw
OAo+ICAgcnRfbXV0ZXhfc2NoZWR1bGUrMHgzMC8weDYwCj4gICBfX3J0X211dGV4X3Nsb3dsb2Nr
X2xvY2tlZC5jb25zdHByb3AuMCsweDQ2MC8weDhhOAo+ICAgcndiYXNlX3dyaXRlX2xvY2srMHgy
NGMvMHgzNzgKPiAgIGRvd25fd3JpdGUrMHgxYy8weDMwCj4gICBmMmZzX2JhbGFuY2VfZnMrMHgx
ODQvMHgyMDgKPiAgIGYyZnNfd3JpdGVfaW5vZGUrMHhmNC8weDMyOAo+ICAgX193cml0ZWJhY2tf
c2luZ2xlX2lub2RlKzB4MzcwLzB4NDk4Cj4gICB3cml0ZWJhY2tfc2JfaW5vZGVzKzB4MjM0LzB4
NGE4Cj4gICBfX3dyaXRlYmFja19pbm9kZXNfd2IrMHg1OC8weDExOAo+ICAgd2Jfd3JpdGViYWNr
KzB4MmY4LzB4M2MwCj4gICB3Yl93b3JrZm4rMHgyYzQvMHg1MDgKPiAgIHByb2Nlc3Nfb25lX3dv
cmsrMHgxODAvMHg0MDgKPiAgIHdvcmtlcl90aHJlYWQrMHgyNTgvMHgzNjgKPiAgIGt0aHJlYWQr
MHgxMTgvMHgxMjgKPiAgIHJldF9mcm9tX2ZvcmsrMHgxMC8weDIwCj4KPiBJTkZPOiB0YXNrIEI6
MTkwMiBibG9ja2VkIGZvciBtb3JlIHRoYW4gMTIwIHNlY29uZHMuCj4gICAgICAgIFRhaW50ZWQ6
IEcgICAgICAgICAgIE8gICAgICAgNi4xMi40MS1nM2ZlMDdkZGYwNWFiICMxCj4gImVjaG8gMCA+
IC9wcm9jL3N5cy9rZXJuZWwvaHVuZ190YXNrX3RpbWVvdXRfc2VjcyIgZGlzYWJsZXMgdGhpcyBt
ZXNzYWdlLgo+IHRhc2s6QiAgICAgc3RhdGU6RCBzdGFjazowICAgICBwaWQ6MTkwMiAgdGdpZDox
NjI2ICBwcGlkOjExNTMgICBmbGFnczoweDAwMDAwMjBjCj4gQ2FsbCB0cmFjZToKPiAgIF9fc3dp
dGNoX3RvKzB4ZjQvMHgxNTgKPiAgIF9fc2NoZWR1bGUrMHgyN2MvMHg5MDgKPiAgIHJ0X211dGV4
X3NjaGVkdWxlKzB4MzAvMHg2MAo+ICAgX19ydF9tdXRleF9zbG93bG9ja19sb2NrZWQuY29uc3Rw
cm9wLjArMHg0NjAvMHg4YTgKPiAgIHJ3YmFzZV93cml0ZV9sb2NrKzB4MjRjLzB4Mzc4Cj4gICBk
b3duX3dyaXRlKzB4MWMvMHgzMAo+ICAgZjJmc19iYWxhbmNlX2ZzKzB4MTg0LzB4MjA4Cj4gICBm
MmZzX21hcF9ibG9ja3MrMHg5NGMvMHgxMTEwCj4gICBmMmZzX2ZpbGVfd3JpdGVfaXRlcisweDIy
OC8weGI4MAo+ICAgZG9faXRlcl9yZWFkdl93cml0ZXYrMHhmMC8weDFlMAo+ICAgdmZzX3dyaXRl
disweDEzOC8weDJjOAo+ICAgZG9fd3JpdGV2KzB4ODgvMHgxMzAKPiAgIF9fYXJtNjRfc3lzX3dy
aXRldisweDI4LzB4NDAKPiAgIGludm9rZV9zeXNjYWxsKzB4NTAvMHgxMjAKPiAgIGVsMF9zdmNf
Y29tbW9uLmNvbnN0cHJvcC4wKzB4YzgvMHhmMAo+ICAgZG9fZWwwX3N2YysweDI0LzB4MzgKPiAg
IGVsMF9zdmMrMHgzMC8weGY4Cj4gICBlbDB0XzY0X3N5bmNfaGFuZGxlcisweDEyMC8weDEzMAo+
ICAgZWwwdF82NF9zeW5jKzB4MTkwLzB4MTk4Cj4KPiBJTkZPOiB0YXNrIHN5bmM6Mjc2OTg0OSBi
bG9ja2VkIGZvciBtb3JlIHRoYW4gMTIwIHNlY29uZHMuCj4gICAgICAgIFRhaW50ZWQ6IEcgICAg
ICAgICAgIE8gICAgICAgNi4xMi40MS1nM2ZlMDdkZGYwNWFiICMxCj4gImVjaG8gMCA+IC9wcm9j
L3N5cy9rZXJuZWwvaHVuZ190YXNrX3RpbWVvdXRfc2VjcyIgZGlzYWJsZXMgdGhpcyBtZXNzYWdl
Lgo+IHRhc2s6c3luYyAgICAgICAgICAgIHN0YXRlOkQgc3RhY2s6MCAgICAgcGlkOjI3Njk4NDkg
dGdpZDoyNzY5ODQ5IHBwaWQ6NzM2ICAgIGZsYWdzOjB4MDAwMDAyMGMKPiBDYWxsIHRyYWNlOgo+
ICAgX19zd2l0Y2hfdG8rMHhmNC8weDE1OAo+ICAgX19zY2hlZHVsZSsweDI3Yy8weDkwOAo+ICAg
c2NoZWR1bGUrMHgzYy8weDExOAo+ICAgd2Jfd2FpdF9mb3JfY29tcGxldGlvbisweGIwLzB4ZTgK
PiAgIHN5bmNfaW5vZGVzX3NiKzB4YzgvMHgyYjAKPiAgIHN5bmNfaW5vZGVzX29uZV9zYisweDI0
LzB4MzgKPiAgIGl0ZXJhdGVfc3VwZXJzKzB4YTgvMHgxMzgKPiAgIGtzeXNfc3luYysweDU0LzB4
YzgKPiAgIF9fYXJtNjRfc3lzX3N5bmMrMHgxOC8weDMwCj4gICBpbnZva2Vfc3lzY2FsbCsweDUw
LzB4MTIwCj4gICBlbDBfc3ZjX2NvbW1vbi5jb25zdHByb3AuMCsweGM4LzB4ZjAKPiAgIGRvX2Vs
MF9zdmMrMHgyNC8weDM4Cj4gICBlbDBfc3ZjKzB4MzAvMHhmOAo+ICAgZWwwdF82NF9zeW5jX2hh
bmRsZXIrMHgxMjAvMHgxMzAKPiAgIGVsMHRfNjRfc3luYysweDE5MC8weDE5OAo+Cj4gVGhlIHJv
b3QgY2F1c2UgaXMgYSBwb3RlbnRpYWwgZGVhZGxvY2sgYmV0d2VlbiB0aGUgZm9sbG93aW5nIHRh
c2tzOgo+Cj4ga3dvcmtlci91ODoxMQkJCQlUaHJlYWQgQQo+IC0gZjJmc193cml0ZV9zaW5nbGVf
ZGF0YV9wYWdlCj4gICAtIGYyZnNfZG9fd3JpdGVfZGF0YV9wYWdlCj4gICAgLSBmb2xpb19zdGFy
dF93cml0ZWJhY2soWCkKPiAgICAtIGYyZnNfb3V0cGxhY2Vfd3JpdGVfZGF0YQo+ICAgICAtIGJp
b19hZGRfZm9saW8oWCkKPiAgIC0gZm9saW9fdW5sb2NrKFgpCj4gCQkJCQktIHRydW5jYXRlX2lu
b2RlX3BhZ2VzX3JhbmdlCj4gCQkJCQkgLSBfX2ZpbGVtYXBfZ2V0X2ZvbGlvKFgsIEZHUF9MT0NL
KQo+IAkJCQkJIC0gdHJ1bmNhdGVfaW5vZGVfcGFydGlhbF9mb2xpbyhYKQo+IAkJCQkJICAtIGZv
bGlvX3dhaXRfd3JpdGViYWNrKFgpCj4gICAtIGYyZnNfYmFsYW5jZV9mcwo+ICAgIC0gZjJmc19n
Ywo+ICAgICAtIGRvX2dhcmJhZ2VfY29sbGVjdAo+ICAgICAgLSBtb3ZlX2RhdGFfcGFnZQo+ICAg
ICAgIC0gZjJmc19nZXRfbG9ja19kYXRhX3BhZ2UKPiAgICAgICAgLSBfX2ZpbGVtYXBfZ2V0X2Zv
bGlvKFgsIEZHUF9MT0NLKQo+Cj4gQm90aCB0aHJlYWRzIHRyeSB0byBhY2Nlc3MgZm9saW8gWC4g
VGhyZWFkIEEgaG9sZHMgdGhlIGxvY2sgYnV0IHdhaXRzCj4gZm9yIHdyaXRlYmFjaywgd2hpbGUg
a3dvcmtlciB3YWl0cyBmb3IgdGhlIGxvY2suIFRoaXMgY2F1c2VzIGEgZGVhZGxvY2suCj4KPiBP
dGhlciB0aHJlYWRzIGFsc28gZW50ZXIgRCBzdGF0ZSwgd2FpdGluZyBmb3IgbG9ja3Mgc3VjaCBh
cyBnY19sb2NrIGFuZAo+IHdyaXRlcGFnZXMuCj4KPiBUbyBhdm9pZCB0aGlzIHBvdGVudGlhbCBk
ZWFkbG9jaywgYWx3YXlzIGNhbGwgZjJmc19zdWJtaXRfbWVyZ2VkX3dyaXRlCj4gYmVmb3JlIHRy
aWdnZXJpbmcgZjJmc19nYyBpbiBmMmZzX2JhbGFuY2VfZnMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBS
dWlwZW5nIFFpPHJ1aXBlbmdxaTNAZ21haWwuY29tPgo+IC0tLQo+ICAgZnMvZjJmcy9zZWdtZW50
LmMgfCAxNCArKysrKysrKysrKysrKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMo
KykKPgo+IGRpZmYgLS1naXQgYS9mcy9mMmZzL3NlZ21lbnQuYyBiL2ZzL2YyZnMvc2VnbWVudC5j
Cj4gaW5kZXggNmE5N2ZlNzY3MTJiLi5iNTgyOTllNDljMjMgMTAwNjQ0Cj4gLS0tIGEvZnMvZjJm
cy9zZWdtZW50LmMKPiArKysgYi9mcy9mMmZzL3NlZ21lbnQuYwo+IEBAIC00NTQsNiArNDU0LDIw
IEBAIHZvaWQgZjJmc19iYWxhbmNlX2ZzKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgYm9vbCBu
ZWVkKQo+ICAgCQlpb19zY2hlZHVsZSgpOwo+ICAgCQlmaW5pc2hfd2FpdCgmc2JpLT5nY190aHJl
YWQtPmZnZ2Nfd3EsICZ3YWl0KTsKPiAgIAl9IGVsc2Ugewo+ICsKPiArCQkvKgo+ICsJCSAqIEJl
Zm9yZSB0cmlnZ2VyaW5nIGZvcmVncm91bmQgR0MsIHN1Ym1pdCBhbGwgY2FjaGVkIERBVEEKPiAr
CQkgKiB3cml0ZSBiaW9zLiBEdXJpbmcgd3JpdGViYWNrLCBwYWdlcyBtYXkgYmUgYWRkZWQgdG8K
PiArCQkgKiB3cml0ZV9pb1tEQVRBXS5iaW8gd2l0aCBQR193cml0ZWJhY2sgc2V0IGJ1dCB0aGUg
YmlvIG5vdAo+ICsJCSAqIHlldCBzdWJtaXR0ZWQuIElmIEdDJ3MgbW92ZV9kYXRhX3BhZ2UoKSBi
bG9ja3Mgb24KPiArCQkgKiBfX2ZvbGlvX2xvY2soKSBmb3Igc3VjaCBhIGZvbGlvLCBhbmQgdGhl
IGxvY2sgaG9sZGVyIHdhaXRzCj4gKwkJICogZm9yIFBHX3dyaXRlYmFjayB0byBjbGVhciB2aWEg
VkZTIGZvbGlvX3dhaXRfd3JpdGViYWNrKCkKPiArCQkgKiBuZWl0aGVyIHRocmVhZCBjYW4gbWFr
ZSBwcm9ncmVzcy4gRmx1c2hpbmcgaGVyZSBlbnN1cmVzCj4gKwkJICogdGhlIGJpbyBjb21wbGV0
aW9uIGNhbGxiYWNrIGNhbiBjbGVhciBQR193cml0ZWJhY2suCj4gKwkJICovCj4gKwo+ICsJCWYy
ZnNfc3VibWl0X21lcmdlZF93cml0ZShzYmksIERBVEEpOwo+ICsKPiAgIAkJc3RydWN0IGYyZnNf
Z2NfY29udHJvbCBnY19jb250cm9sID0gewo+ICAgCQkJLnZpY3RpbV9zZWdubyA9IE5VTExfU0VH
Tk8sCj4gICAJCQkuaW5pdF9nY190eXBlID0gZjJmc19zYl9oYXNfYmxrem9uZWQoc2JpKSA/CgpI
aSDCoGphZWdldWssIGNoYW8KCkdlbnRsZSBwaW5nIG9uIHRoaXMgcGF0Y2guCgpDb3VsZCB5b3Ug
cGxlYXNlIHRha2UgYSBsb29rIHdoZW4geW91IGhhdmUgdGltZT8KSWYgdGhlcmUgYXJlIGFueSBp
c3N1ZXMgd2l0aCB0aGUgcGF0Y2gsIEknbSBoYXBweSB0bwphZGRyZXNzIHRoZW0gaW4gYSBuZXcg
dmVyc2lvbi4KClRoYW5rcwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxA
bGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3Rz
L2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
