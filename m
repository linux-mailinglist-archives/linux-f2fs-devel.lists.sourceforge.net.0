Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A659D07048
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 09 Jan 2026 04:45:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=20RtgIZV4TrhiYljN31soifqpotpusAt/Ybu3n89nBM=; b=PtNULl7sPPGb7FS5rkvKUof8NO
	YFl21fGVfvk4mCXm6uDqYKjMAoqOaZFmWk/17KtPo9ZiM9px5YYFllKyB7/yHGFVVFJEfGk/3pymr
	YOmXnIQJ5c5gUpvEbhIyrouEiB1e4hbYT1u6sZW596rbGM0QaLsntTfaeT2MPYUARkK0=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ve3RL-0005wW-7t;
	Fri, 09 Jan 2026 03:45:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ve3RJ-0005wQ-PR
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 09 Jan 2026 03:45:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/imhtfa1Xf5KtbywqJPrx4vArcc8jD605FY2kNmghrM=; b=Rth8EpGsGDgJDhTyr8nS2QnAtU
 pRy6Drazp5K2Mv1o6jnkbfs+9H1ngzMvJIGmC77r0q+a6j3ptkvqyA/4uJAOom2Sdkxf0qvBZ7uHo
 keITi1gUmbjsOq84SQYbWvYooes8+oqj41zGWxhx5IIa2IWFj1w4HaUWZkjFATQrLRuI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/imhtfa1Xf5KtbywqJPrx4vArcc8jD605FY2kNmghrM=; b=MynGhOWNW5q8jBrx/GnPTYXS9l
 pIpxRJaHCaekIe/vKIBROuSSYFmWMNW/T1xTefRMBbyqJINQFCTe7dZLuVsV8vnAEsPxzHCw/Oj9x
 AwTzvcJMehQIu+t25zxStBjYVfPjt/oB2gXOj/nouYTAQr3YWW0YrmBNfK0wcdpvOnSs=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ve3RJ-0000nS-7N for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 09 Jan 2026 03:45:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D87DE40DF1;
 Fri,  9 Jan 2026 03:45:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B29AC4CEF1;
 Fri,  9 Jan 2026 03:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767930318;
 bh=3swegdi4GX1qhshed/ec9WKo4JfH5/Z4kN3dIpPld4s=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=TU72MC9CtVbX3V38b8OESX+W8SUG46XnZqIvSTcfd7Nv5sJxzzzNwSWoaTGWNX4qe
 O51ssSCGh+2TMVO2fthlvX5wXTmlKdaXEBLIsbQnqKfgFXb7vF6hH5ISaDtLqBSZvQ
 JuVKfyr6onMtkq/USsHdtfy8sYoZ66JhUwq7PDhrNLt9heflMwSv5cThfqu6PiNGgK
 RoR2j/7OQ7oOlcz8NHAw1JS04R/uVzE5dDQsbT3H+h1q79gVxGrrlQ1OY1YRPb6bnv
 ZMz5FhK/J8tIyY4D4YBAK1K2/S45WLG30cLUnP0sKPxCRi95S9rN7S2zg9SLFRm1fN
 eLKkbVHvgQyyg==
Message-ID: <2cdd4281-7e37-4dd0-91b1-1ab16ef772aa@kernel.org>
Date: Fri, 9 Jan 2026 11:45:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Barry Song <21cnbao@gmail.com>
References: <20260109024716.12047-1-chao@kernel.org>
 <CAGsJ_4wjXMXk4YKsYebmtTa5dKVO21b91ieY=foYULWS+DyroQ@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAGsJ_4wjXMXk4YKsYebmtTa5dKVO21b91ieY=foYULWS+DyroQ@mail.gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 1/9/2026 11:05 AM, Barry Song wrote: > On Fri, Jan 9, 2026
 at 3:47 PM Chao Yu <chao@kernel.org> wrote: >> >> Below testcase can change
 large folio supported inode from immutable >> to mutable, it's [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ve3RJ-0000nS-7N
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to prevent clearing immutable for
 large folio supported inode
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMS85LzIwMjYgMTE6MDUgQU0sIEJhcnJ5IFNvbmcgd3JvdGU6Cj4gT24gRnJpLCBKYW4gOSwg
MjAyNiBhdCAzOjQ34oCvUE0gQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiB3cm90ZToKPj4KPj4g
QmVsb3cgdGVzdGNhc2UgY2FuIGNoYW5nZSBsYXJnZSBmb2xpbyBzdXBwb3J0ZWQgaW5vZGUgZnJv
bSBpbW11dGFibGUKPj4gdG8gbXV0YWJsZSwgaXQncyBub3QgYXMgZXhwZWN0ZWQsIGxldCdzIGFk
ZCBhIG5ldyBjaGVjayBjb25kaXRpb24gaW4KPj4gZjJmc19zZXRmbGFnc19jb21tb24oKSB0byBk
ZXRlY3QgYW5kIHJlamVjdCBpdC4KPj4KPj4gLSBkZCBpZj0vZGV2L3plcm8gb2Y9L21udC9mMmZz
L3Rlc3QgYnM9MzJrIGNvdW50PTQKPj4gLSBmMmZzX2lvIHNldGZsYWdzIGltbXV0YWJsZSAvbW50
L2YyZnMvdGVzdAo+PiAtIGVjaG8gMyA+IC9wcm9jL3N5cy92bS9kcm9wX2NhY2hlcwo+PiAgIDog
dG8gcmVsb2FkIGlub2RlIHdpdGggbGFyZ2UgZm9saW8KPj4gLSBmMmZzX2lvIHJlYWQgMzIgMCAx
IG1tYXAgMCAwIC9tbnQvZjJmcy90ZXN0Cj4+IC0gZjJmc19pbyBjbGVhcmZsYWdzIGltbXV0YWJs
ZSAvbW50L2YyZnMvdGVzdAo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBDaGFvIFl1IDxjaGFvQGtlcm5l
bC5vcmc+Cj4+IC0tLQo+PiAgIGZzL2YyZnMvZmlsZS5jIHwgNiArKysrKysKPj4gICAxIGZpbGUg
Y2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2ZpbGUu
YyBiL2ZzL2YyZnMvZmlsZS5jCj4+IGluZGV4IGNlMjkxZjE1MmJjMy4uZjdmOWRhMGIyMTVmIDEw
MDY0NAo+PiAtLS0gYS9mcy9mMmZzL2ZpbGUuYwo+PiArKysgYi9mcy9mMmZzL2ZpbGUuYwo+PiBA
QCAtMjE1NSw2ICsyMTU1LDEyIEBAIHN0YXRpYyBpbnQgZjJmc19zZXRmbGFnc19jb21tb24oc3Ry
dWN0IGlub2RlICppbm9kZSwgdTMyIGlmbGFncywgdTMyIG1hc2spCj4+ICAgICAgICAgICAgICAg
ICAgfQo+PiAgICAgICAgICB9Cj4+Cj4+ICsgICAgICAgaWYgKChpZmxhZ3MgXiBtYXNrZWRfZmxh
Z3MpICYgRjJGU19JTU1VVEFCTEVfRkwpIHsKPj4gKyAgICAgICAgICAgICAgIGlmICgobWFza2Vk
X2ZsYWdzICYgRjJGU19JTU1VVEFCTEVfRkwpICYmCj4+ICsgICAgICAgICAgICAgICAgICAgICAg
IG1hcHBpbmdfbGFyZ2VfZm9saW9fc3VwcG9ydChpbm9kZS0+aV9tYXBwaW5nKSkKPj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gCgpCYXJyeSwKCkkgbm90aWNlZCB0
aGF0IHdlIGFyZSBhbGxvd2VkIHRvIGNsZWFyIGltbXV0YWJsZSBpZiBsYXJnZSBmb2xpbyBhcmUg
c3VwcG9ydGVkCmluIHRhcmdldCBpbm9kZSwgc2luY2Ugd2UgY2FuIHByZXZlbnQgdG8gb3BlbiB3
LyB3cml0ZSBwZXJtaXNzaW9uIGluIC0+b3BlbiBhZnRlcgppbW11dGFibGUgaXMgY2xlYXJlZCwg
c2VlIGRldGFpbHMgaW4gZjJmcyBkb2MgYmVsb3cuCgpTbywgYW55d2F5LCBJIGd1ZXNzIG15IHBh
dGNoIHNob3VsZCBiZSBpZ25vcmVkLgoKUGVyLWZpbGUgUmVhZC1Pbmx5IExhcmdlIEZvbGlvIFN1
cHBvcnQKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KCkYyRlMgaW1wbGVt
ZW50cyBsYXJnZSBmb2xpbyBzdXBwb3J0IG9uIHRoZSByZWFkIHBhdGggdG8gbGV2ZXJhZ2UgaGln
aC1vcmRlcgpwYWdlIGFsbG9jYXRpb24gZm9yIHNpZ25pZmljYW50IHBlcmZvcm1hbmNlIGdhaW5z
LiBUbyBtaW5pbWl6ZSBjb2RlIGNvbXBsZXhpdHksCnRoaXMgc3VwcG9ydCBpcyBjdXJyZW50bHkg
ZXhjbHVkZWQgZnJvbSB0aGUgd3JpdGUgcGF0aCwgd2hpY2ggcmVxdWlyZXMgaGFuZGxpbmcKY29t
cGxleCBvcHRpbWl6YXRpb25zIHN1Y2ggYXMgY29tcHJlc3Npb24gYW5kIGJsb2NrIGFsbG9jYXRp
b24gbW9kZXMuCgpUaGlzIG9wdGlvbmFsIGZlYXR1cmUgaXMgdHJpZ2dlcmVkIG9ubHkgd2hlbiBh
IGZpbGUncyBpbW11dGFibGUgYml0IGlzIHNldC4KQ29uc2VxdWVudGx5LCBGMkZTIHdpbGwgcmV0
dXJuIEVPUE5PVFNVUFAgaWYgYSB1c2VyIGF0dGVtcHRzIHRvIG9wZW4gYSBjYWNoZWQKZmlsZSB3
aXRoIHdyaXRlIHBlcm1pc3Npb25zLCBldmVuIGltbWVkaWF0ZWx5IGFmdGVyIGNsZWFyaW5nIHRo
ZSBiaXQuIFdyaXRlCmFjY2VzcyBpcyBvbmx5IHJlc3RvcmVkIG9uY2UgdGhlIGNhY2hlZCBpbm9k
ZSBpcyBkcm9wcGVkLiBUaGUgdXNhZ2UgZmxvdyBpcwpkZW1vbnN0cmF0ZWQgYmVsb3c6CgouLiBj
b2RlLWJsb2NrOjoKCiAgICAjIGYyZnNfaW8gc2V0ZmxhZ3MgaW1tdXRhYmxlIC9kYXRhL3Rlc3Rm
aWxlX3JlYWRfc2VxCgogICAgLyogZmx1c2ggYW5kIHJlbG9hZCB0aGUgaW5vZGUgdG8gZW5hYmxl
IHRoZSBsYXJnZSBmb2xpbyAqLwogICAgIyBzeW5jICYmIGVjaG8gMyA+IC9wcm9jL3N5cy92bS9k
cm9wX2NhY2hlcwoKICAgIC8qIG1tYXAoTUFQX1BPUFVMQVRFKSArIG1sb2NrKCkgKi8KICAgICMg
ZjJmc19pbyByZWFkIDEyOCAwIDEwMjQgbW1hcCAxIDAgL2RhdGEvdGVzdGZpbGVfcmVhZF9zZXEK
CiAgICAvKiBtbWFwKCkgKyBmYWR2aXNlKFBPU0lYX0ZBRFZfV0lMTE5FRUQpICsgbWxvY2soKSAq
LwogICAgIyBmMmZzX2lvIHJlYWQgMTI4IDAgMTAyNCBmYWR2aXNlIDEgMCAvZGF0YS90ZXN0Zmls
ZV9yZWFkX3NlcQoKICAgIC8qIG1tYXAoKSArIG1sb2NrMihNTE9DS19PTkZBVUxUKSArIG1hZHZp
c2UoTUFEVl9QT1BVTEFURV9SRUFEKSAqLwogICAgIyBmMmZzX2lvIHJlYWQgMTI4IDAgMTAyNCBt
YWR2aXNlIDEgMCAvZGF0YS90ZXN0ZmlsZV9yZWFkX3NlcQoKICAgICMgZjJmc19pbyBjbGVhcmZs
YWdzIGltbXV0YWJsZSAvZGF0YS90ZXN0ZmlsZV9yZWFkX3NlcQoKICAgICMgZjJmc19pbyB3cml0
ZSAxIDAgMSB6ZXJvIGJ1ZmZlcmVkIC9kYXRhL3Rlc3RmaWxlX3JlYWRfc2VxCiAgICBGYWlsZWQg
dG8gb3BlbiAvbW50L3Rlc3QvdGVzdDogT3BlcmF0aW9uIG5vdCBzdXBwb3J0ZWQKCiAgICAvKiBm
bHVzaCBhbmQgcmVsb2FkIHRoZSBpbm9kZSB0byBkaXNhYmxlIHRoZSBsYXJnZSBmb2xpbyAqLwog
ICAgIyBzeW5jICYmIGVjaG8gMyA+IC9wcm9jL3N5cy92bS9kcm9wX2NhY2hlcwoKICAgICMgZjJm
c19pbyB3cml0ZSAxIDAgMSB6ZXJvIGJ1ZmZlcmVkIC9kYXRhL3Rlc3RmaWxlX3JlYWRfc2VxCiAg
ICBXcml0dGVuIDQwOTYgYnl0ZXMgd2l0aCBwYXR0ZXJuID0gemVybywgdG90YWxfdGltZSA9IDI5
IHVzLCBtYXhfbGF0ZW5jeSA9IDI4IHVzCgogICAgIyBybSAvZGF0YS90ZXN0ZmlsZV9yZWFkX3Nl
cQoKPiBIaSBZdSwgSSBmaW5kIGl0IGEgYml0IG9kZCB0byBwcmV2ZW50IHVuc2V0dGluZyBpbW11
dGFibGUgc29sZWx5Cj4gYmVjYXVzZSBsYXJnZSBmb2xpb3MgYXJlIGluIHVzZS4gSWYgdW5zZXR0
aW5nIGltbXV0YWJsZSBpcyBjb25zaWRlcmVkCj4gdW5leHBlY3RlZCBiZWhhdmlvciwgaXQgc2hv
dWxkIGJlIGRpc2FsbG93ZWQgcmVnYXJkbGVzcyBvZiB3aGV0aGVyCj4gbGFyZ2UgZm9saW9zIGFy
ZSB1c2VkLCBhbmQgYXBwbHkgZXF1YWxseSBpbiBib3RoIGNhc2VzLgoKVG8gY29uZmlybSwgeW91
IG1lYW4gaWYgY2xlYXJpbmcgaW1tdXRhYmxlIGlzIGNvbnNpZGVyZWQgdW5leHBlY3RlZCBiZWhh
dmlvciwKd2UgbmVlZCB0byBwcmV2ZW50IGNsZWFyaW5nIGltbXV0YWJsZSBmb3IgaW5vZGUgd2hp
Y2ggZG9lc24ndCBlbmFibGUgbGFyZ2UgZm9saW8/Cgo+IAo+IEknbSBub3Qgc3VyZSB3aGV0aGVy
IHJldmVydGluZyB0aGUgbGFyZ2UgZm9saW9zIHNldHRpbmcgaXMgdGhlCj4gYmV0dGVyIGFwcHJv
YWNoOgo+IHRydW5jYXRlX3BhZ2VjYWNoZShpbm9kZSwgaW5vZGUtPmlfc2l6ZSk7Cj4gbWFwcGlu
Z19zZXRfZm9saW9fb3JkZXJfcmFuZ2UoaW5vZGUtPmlfbWFwcGluZywgMCwgMCk7CgpJZiB3ZSB3
YW50IHRvIHN1cHBvcnQgcmV2ZXJ0aW5nIHRoZSBsYXJnZSBmb2xpb3Mgc2V0dGluZyBkeW5hbWlj
YWxseSBhcyB5b3UKcHJvcG9zZWQgYWJvdmUsIGl0IG5lZWQgdG8gY29uc2lkZXIgbW9yZSByYWNl
IGNhc2UgYW5kIGNvcm5lciBjYXNlLCBzbywgYQpsaXR0bGUgYml0IGNvbXBsaWNhdGVkLgoKVGhh
bmtzLAoKPiAKPiAKPj4gKyAgICAgICB9Cj4+ICsKPj4gICAgICAgICAgZmktPmlfZmxhZ3MgPSBp
ZmxhZ3MgfCAoZmktPmlfZmxhZ3MgJiB+bWFzayk7Cj4+ICAgICAgICAgIGYyZnNfYnVnX29uKEYy
RlNfSV9TQihpbm9kZSksIChmaS0+aV9mbGFncyAmIEYyRlNfQ09NUFJfRkwpICYmCj4+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKGZpLT5pX2ZsYWdzICYgRjJGU19O
T0NPTVBfRkwpKTsKPj4gLS0KPj4gMi40MC4xCj4gCj4gCj4gVGhhbmtzCj4gQmFycnkKCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1k
ZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQK
aHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1k
ZXZlbAo=
