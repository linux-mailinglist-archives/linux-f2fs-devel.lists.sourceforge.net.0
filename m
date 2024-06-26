Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF309184E0
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 26 Jun 2024 16:52:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sMU0a-00033y-6O;
	Wed, 26 Jun 2024 14:52:28 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sMU0Z-00033n-Ck
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Jun 2024 14:52:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LEhJei7xFc65n/RLkYodo5d5i0PzvhXrg1jv4wrvotQ=; b=VuJuPtL4G0FBwT1HdsnAKTb6aL
 xl1cOkdx2Vu8epMDS6jsZdJz9IkZMocc/fY5h2vNPzDdc7cZwRzeMifSttKYK/48cuc+6kLsn7RLI
 0ecTn1sH3QXaSjX5DefrcbhkelxQ75w0ke3p5Xt2VzzLttlGktI4HgGD1wD+PVwGGjWM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LEhJei7xFc65n/RLkYodo5d5i0PzvhXrg1jv4wrvotQ=; b=mTTkXjhuWzKXV0Wc9K8z+l7zF/
 injOoBr6bQNrowV/ba5HhGGMUnIUeFAIyF0M3PnrFFs3IP7S2VUpicJEhD8AAjaYhNXD0Qu+vPJyW
 BUtKIs9ENYAPk+ANUtlkmcRGuqKYnK2zrugjkydjzJUXFHQcs7acfAvwVEHzjUpCyczI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sMU0Z-0007KJ-Nz for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Jun 2024 14:52:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 979B461A27;
 Wed, 26 Jun 2024 14:52:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D8A6C32782;
 Wed, 26 Jun 2024 14:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719413536;
 bh=3x9aUwLlLr35lFq9vjm9SpBmwK+WBb/nORwA4i0c9DU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=R6vZeqArLHkWtIXakOJchVtRCtfukG1OGrQEcksKO6X0MW3WQwRUtIcrp2Sw6I75t
 EKqMd4D49oSKgE9td3r86efsJhBGyAPmJvToRNXGFLQhKkCGEquOAYhv/fRsPG13QU
 1CCNZEQuwNZcLwDcckB+gZrZCD6Lz/lIXEWMczORqmqBhwhLJDRB7/896TArFwyQcl
 eGfH7mPHZVZRCNaL+diJyl4AL2pBzvEa/pi+aN9yugbX6N7nIph4BnG4yGDOPFDvDp
 nmKXRl24tiucXIf3S7J72+n43/nVTuk8nzq3RwJGTm5A2CEzl9s4+5/N0u23V/Gaay
 Vhz4wZ2032ZKA==
Message-ID: <f5f4f84d-1719-4e8c-a2ce-71453884b19e@kernel.org>
Date: Wed, 26 Jun 2024 22:52:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zhiguo Niu <niuzhiguo84@gmail.com>
References: <20240625142512.3916063-1-chao@kernel.org>
 <CAHJ8P3+VUozoMVHvMxqDrDRVttRWDJ5a4A2ysJv2_O4ytfq8OA@mail.gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
Autocrypt: addr=chao@kernel.org; keydata=
 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
In-Reply-To: <CAHJ8P3+VUozoMVHvMxqDrDRVttRWDJ5a4A2ysJv2_O4ytfq8OA@mail.gmail.com>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2024/6/26 10:01, Zhiguo Niu wrote: > Chao Yu <chao@kernel.org>
    于2024年6月25日周二 22:29写道： >> >> If lfs mode is on, buffered
    read may race w/ OPU dio write as below, >> it may cause bu [...] 
 
 Content analysis details:   (-0.4 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
                             DNSWL was blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [139.178.84.217 listed in list.dnswl.org]
  0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [139.178.84.217 listed in sa-accredit.habeas.com]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                            [139.178.84.217 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sMU0Z-0007KJ-Nz
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix to avoid racing in between read
 and OPU dio write
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyNC82LzI2IDEwOjAxLCBaaGlndW8gTml1IHdyb3RlOgo+IENoYW8gWXUgPGNoYW9Aa2Vy
bmVsLm9yZz4g5LqOMjAyNOW5tDbmnIgyNeaXpeWRqOS6jCAyMjoyOeWGmemBk++8mgo+Pgo+PiBJ
ZiBsZnMgbW9kZSBpcyBvbiwgYnVmZmVyZWQgcmVhZCBtYXkgcmFjZSB3LyBPUFUgZGlvIHdyaXRl
IGFzIGJlbG93LAo+PiBpdCBtYXkgY2F1c2UgYnVmZmVyZWQgcmVhZCBoaXRzIHVud3JpdHRlbiBk
YXRhIHVuZXhwZWN0bHksIGFuZCBmb3IKPj4gZGlvIHJlYWQsIHRoZSByYWNlIGNvbmRpdGlvbiBl
eGlzdHMgYXMgd2VsbC4KPj4KPj4gVGhyZWFkIEEgICAgICAgICAgICAgICAgICAgICAgICBUaHJl
YWQgQgo+PiAtIGYyZnNfZmlsZV93cml0ZV9pdGVyCj4+ICAgLSBmMmZzX2Rpb193cml0ZV9pdGVy
Cj4+ICAgIC0gX19pb21hcF9kaW9fcncKPj4gICAgIC0gZjJmc19pb21hcF9iZWdpbgo+PiAgICAg
IC0gZjJmc19tYXBfYmxvY2tzCj4+ICAgICAgIC0gX19hbGxvY2F0ZV9kYXRhX2Jsb2NrCj4+ICAg
ICAgICAtIGFsbG9jYXRlZCBibGthZGRyICN4Cj4+ICAgICAgICAgLSBpb21hcF9kaW9fc3VibWl0
X2Jpbwo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtIGYyZnNfZmlsZV9yZWFk
X2l0ZXIKPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0gZmlsZW1hcF9yZWFk
Cj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLSBmMmZzX3JlYWRfZGF0YV9m
b2xpbwo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtIGYyZnNfbXBhZ2Vf
cmVhZHBhZ2VzCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtIGYyZnNf
bWFwX2Jsb2Nrcwo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDogZ2V0
IGJsa2FkZHIgI3gKPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0gZjJm
c19zdWJtaXRfcmVhZF9iaW8KPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgSVJR
Cj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0gZjJmc19yZWFkX2VuZF9pbwo+
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgOiByZWFkIElPIG9uIGJsa2FkZHIg
I3ggY29tcGxldGUKPj4gSVJRCj4+IC0gaW9tYXBfZGlvX2Jpb19lbmRfaW8KPj4gICA6IGRpcmVj
dCB3cml0ZSBJTyBvbiBibGthZGRyICN4IGNvbXBsZXRlCj4+Cj4+IEluIExGUyBtb2RlLCBpZiB0
aGVyZSBpcyBpbmZsaWdodCBkaW8sIGxldCdzIGZvcmNlIHJlYWQgdG8gYnVmZmVyZWQKPj4gSU8s
IHRoaXMgcG9saWN5IHdvbid0IGNvdmVyIGFsbCByYWNlIGNhc2VzLCBob3dldmVyIGl0IGlzIGEg
dHJhZGVvZmYKPj4gd2hpY2ggYXZvaWRzIGFidXNpbmcgbG9jayBhcm91bmQgSU8gcGF0aHMuCj4+
Cj4+IEZpeGVzOiBmODQ3YzY5OWNmZjMgKCJmMmZzOiBhbGxvdyBvdXQtcGxhY2UtdXBkYXRlIGZv
ciBkaXJlY3QgSU8gaW4gTEZTIG1vZGUiKQo+PiBTaWduZWQtb2ZmLWJ5OiBDaGFvIFl1IDxjaGFv
QGtlcm5lbC5vcmc+Cj4+IC0tLQo+PiAgIGZzL2YyZnMvZmlsZS5jIHwgNCArKysrCj4+ICAgMSBm
aWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9m
aWxlLmMgYi9mcy9mMmZzL2ZpbGUuYwo+PiBpbmRleCAyNzg1NzM5NzRkYjQuLjg2NmYxYTM0ZTky
YiAxMDA2NDQKPj4gLS0tIGEvZnMvZjJmcy9maWxlLmMKPj4gKysrIGIvZnMvZjJmcy9maWxlLmMK
Pj4gQEAgLTg4Miw2ICs4ODIsMTAgQEAgc3RhdGljIGJvb2wgZjJmc19mb3JjZV9idWZmZXJlZF9p
byhzdHJ1Y3QgaW5vZGUgKmlub2RlLCBpbnQgcncpCj4+ICAgICAgICAgICAgICAgICAgcmV0dXJu
IHRydWU7Cj4+ICAgICAgICAgIGlmIChpc19zYmlfZmxhZ19zZXQoc2JpLCBTQklfQ1BfRElTQUJM
RUQpKQo+PiAgICAgICAgICAgICAgICAgIHJldHVybiB0cnVlOwo+PiArICAgICAgIC8qIEluIExG
UyBtb2RlLCBpZiB0aGVyZSBpcyBpbmZsaWdodCBkaW8sIGZvcmNlIHJlYWQgdG8gYnVmZmVyZWQg
SU8gKi8KPj4gKyAgICAgICBpZiAocncgPT0gUkVBRCAmJiBmMmZzX2xmc19tb2RlKHNiaSkgJiYK
Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgYXRvbWljX3JlYWQoJmlub2RlLT5pX2Rpb19jb3Vu
dCkpCj4+ICsgICAgICAgICAgICAgICByZXR1cm4gZmFsc2U7Cj4gSGkgQ2hhbywKPiBBIGxpdHRs
ZSBkb3VidDop77yMZm9yY2Ug4oCcYnVmZmVyZWQgSU/igJ0gc2hvdWxkIHJldHVybiAidHJ1ZSI/
CgpPb3BzLCB0b28gcnVzaCB0byBzZW5kIHRoZSBwYXRjaC4uLgoKPiBhbm90aGVyIHdhbnQgdG8g
Y29uZmlybSBpcywgInRocmVhZCBCIiBpbiBjb21taXQgbXNnIGp1c3QgZG9pbmcgYnVmZmVyCj4g
cmVhZCwgc28gdGhpcyBtb2RpZmljYXRpb24ganVzdCBjb3ZlciBkaXJlY3QgcmVhZCBjYXNl77yf
CgpPaCwgdGhlIGZpeCBpcyBpbmNvcnJlY3QsIHdpbGwgbG9vayBpbnRvIGl0IHNvb24uCgpUaGFu
a3MsCgo+IHRoYW5rc++8gQo+Pgo+PiAgICAgICAgICByZXR1cm4gZmFsc2U7Cj4+ICAgfQo+PiAt
LQo+PiAyLjQwLjEKPj4KPj4KPj4KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPj4gTGludXgt
ZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vm
b3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGlu
ZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlz
dHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
