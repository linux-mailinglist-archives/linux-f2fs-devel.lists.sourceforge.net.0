Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1935C9F5FC3
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Dec 2024 09:01:02 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tNozE-0004Uc-OM;
	Wed, 18 Dec 2024 08:00:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sunyibuaa@gmail.com>) id 1tNozD-0004UU-UX
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Dec 2024 08:00:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=waSyfwPGySvzek1TQZaSciBZoVBrCzftuLt3iQ1vVBA=; b=FQDkaaASN89IbsK8wU4KyRGYLI
 TkWFK9i3m/YJrpQo484OwZe+cUZSagKAConuOY82A1k2RM6FvPn31SJ7APe05cg+xvoJh3Gm0pYO4
 xYKxen8wNRI+nl5OiskszMIRFV7l/fba/SSgw+mPUDL9/8lYCcd43Vp2h/jfCYWiMBRY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=waSyfwPGySvzek1TQZaSciBZoVBrCzftuLt3iQ1vVBA=; b=SrvAc15JLYoh874DCGFBHpkXQf
 ZUlmSDjcau7R2675INAyKue91wcggSNvTtq6sa7heRgfbAq1J05ptz2U/P4y0ckAo7P2ZVeH+SEzg
 cKWTpUVZGE2RYitss44fSninzuQx5ZYfwynsN0W1oMHtzvU65ldKqNn9qk7ocLmNu2wU=;
Received: from mail-lf1-f47.google.com ([209.85.167.47])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tNozD-0005DS-RF for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Dec 2024 08:00:52 +0000
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-5401c52000dso6611713e87.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 18 Dec 2024 00:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734508840; x=1735113640; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=waSyfwPGySvzek1TQZaSciBZoVBrCzftuLt3iQ1vVBA=;
 b=Uul7od50pQa++E0mU4QxRN94Ki/H+L+gtG1kpQqKnei0nnQZiV97n8jn2RdoFIf209
 Rkb/usha++SL+ErYcbIj1Bm5pk8RZS/w7Io12HVk3PKaW3xu9EK9Cx9SYZSlN12MY8+q
 MyOlHcyXuMC1gxjFH13kp37B69ZKskHqN5bakXLvxD2b9ovRtOH4kv0rRS+/0fR0zB8n
 YmIjNwM9f1FUNwAIbQO0/6qKPaU2fh5p7SLNRCCI845hyiuOE5rk4iGkIU6ilGR9nVqQ
 URVFzXZ/uTxaSWHgpVEM8ezZWl2JqBFMPntuwoAqpLP0xMgRXCayULz+a8quNLcytjPx
 bPow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734508840; x=1735113640;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=waSyfwPGySvzek1TQZaSciBZoVBrCzftuLt3iQ1vVBA=;
 b=MoX28+j8ed0C6xejNtFClF+Jh/MgACih1k8BZaidfhY8PXN6+G2xAILTEV7TGD5qvM
 kT6JDYB0EX254m3i5W9sjr6kvfoP3zQMtCVmuVuhPx+dP7XkvAgiO+TCDsb3cq2O5v3H
 7JbJFp1p/KFNWVTs7B7vR6ugJqAjPMvnURFla7Qnnyo/YWaxpmUPoUfXYtI2QKrF0b9f
 xtPO0jjQHvT3zuyQQV+4wlKJWysriuVmcJLuuq4RCuq9BSZBp4tW4p7iffeerUj07prf
 Fnis6rUxK9M0xyFd2W4B6nSCd6O6acSl1tRlOfDnX5UJmL35J8xmz1HJqKEovvDfsiXI
 crPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXeW2bx/Tu76NaJtDX0kGVNjZNPv8Ekwb6SypXRJzTCXHoWsqH1mK/ZKnGzrehxVMAJxPACbSxua5MwA4mhO/i+@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzQq54M+z/H25quG0w2HUSiY9UYRhGgyWWSd6g9TcICR28WN8Mr
 e/wQ7/kBkOjMHH2sV3KDdZsQQTu4/9XmaE1KrW3xkzm+ivJfmE2YNXhGjddpoKEFvMgK58SvR3o
 +qZHYRYuLMql70BGwuUcJ+UvjYLJ5+7nv
X-Gm-Gg: ASbGncslg5eMdTr9qqwrzXFsY8o1YAZAiNFpOaGBZ8aKl7HAQrFPwjJxiFPUVLtLl7c
 41AVP83b584AqZUPnwtqjxZcN3lRfpZukygJgHcA=
X-Google-Smtp-Source: AGHT+IHkADiSSHWsVXyz2lk510k+hzVLrr7ktiHxImxVn4PDBZws/LlOTDCzHfsPoxGs+sLYflXKy1SX86q0BUIw6QM=
X-Received: by 2002:a05:6512:3e28:b0:540:3594:aa39 with SMTP id
 2adb3069b0e04-541e674456cmr588354e87.5.1734508839670; Wed, 18 Dec 2024
 00:00:39 -0800 (PST)
MIME-Version: 1.0
References: <20241104034545.497907-1-yi.sun@unisoc.com>
 <20241104034545.497907-6-yi.sun@unisoc.com>
 <CALpufv34r8cMv0BtGXWLd_LEBjtMGM+CZ=XpnsL8Qr8WOsOk6Q@mail.gmail.com>
 <Z1sNw-rrvAnpwY3r@google.com>
In-Reply-To: <Z1sNw-rrvAnpwY3r@google.com>
From: yi sun <sunyibuaa@gmail.com>
Date: Wed, 18 Dec 2024 16:00:03 +0800
Message-ID: <CALpufv1F0k=w7KB-uEtnDcxJQKPbJ-xOpgO=QOxzhiqLVh4WMA@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -1.3 (-)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Fri, Dec 13, 2024 at 12:22 AM Jaegeuk Kim wrote: > >
   On 12/11, yi sun wrote: > > Kindly ping. > > I think there are no problems
    with the first few patches, but the > > current patch may still h [...] 
 
 Content analysis details:   (-1.3 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.167.47 listed in sa-accredit.habeas.com]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.167.47 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [sunyibuaa[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -1.1 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.167.47 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.167.47 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
X-Headers-End: 1tNozD-0005DS-RF
Subject: Re: [f2fs-dev] [PATCH v3 5/5] f2fs: Optimize
 f2fs_truncate_data_blocks_range()
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
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 Yi Sun <yi.sun@unisoc.com>, linux-f2fs-devel@lists.sourceforge.net,
 Hao_hao.Wang@unisoc.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gRnJpLCBEZWMgMTMsIDIwMjQgYXQgMTI6MjLigK9BTSBKYWVnZXVrIEtpbSA8amFlZ2V1a0Br
ZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIDEyLzExLCB5aSBzdW4gd3JvdGU6Cj4gPiBLaW5kbHkg
cGluZy4KPiA+IEkgdGhpbmsgdGhlcmUgYXJlIG5vIHByb2JsZW1zIHdpdGggdGhlIGZpcnN0IGZl
dyBwYXRjaGVzLCBidXQgdGhlCj4gPiBjdXJyZW50IHBhdGNoIG1heSBzdGlsbCBoYXZlIHJvb20g
Zm9yIGltcHJvdmVtZW50LiBEbyB5b3UgaGF2ZSBhbnkKPiA+IGdvb2Qgc3VnZ2VzdGlvbnM/Cj4K
PiBIaSwgbWF5IEkgYXNrIGZvciBzb21lIGJhc2ljIHRlc3RzPyBIYXZlIHlvdSBydW4geGZzdGVz
dHM/Cj4KClllcywgSSB1c2VkIHBob25lcyB3aXRoIEFuZHJvaWQxNStrZXJuZWw2LjYgZm9yIGJh
c2ljIHRlc3RpbmcsCmluY2x1ZGluZyA0OCBob3VycyBvZiAibW9ua2V5ICsgZmlsZSByZWFkLCB3
cml0ZSBhbmQgZGVsZXRlIiB0ZXN0aW5nCmFuZCB4ZnN0ZXN0cy4KTm8gZXJyb3JzIGZvdW5kLgoK
PiA+Cj4gPiBPbiBNb24sIE5vdiA0LCAyMDI0IGF0IDExOjQ24oCvQU0gWWkgU3VuIDx5aS5zdW5A
dW5pc29jLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IEZ1bmN0aW9uIGYyZnNfaW52YWxpZGF0ZV9i
bG9ja3MoKSBjYW4gcHJvY2VzcyBjb250aW51b3VzCj4gPiA+IGJsb2NrcyBhdCBhIHRpbWUsIHNv
IGYyZnNfdHJ1bmNhdGVfZGF0YV9ibG9ja3NfcmFuZ2UoKSBpcwo+ID4gPiBvcHRpbWl6ZWQgdG8g
dXNlIHRoZSBuZXcgZnVuY3Rpb25hbGl0eSBvZgo+ID4gPiBmMmZzX2ludmFsaWRhdGVfYmxvY2tz
KCkuCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IFlpIFN1biA8eWkuc3VuQHVuaXNvYy5jb20+
Cj4gPiA+IC0tLQo+ID4gPiAgZnMvZjJmcy9maWxlLmMgfCA3MiArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDY4
IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9m
cy9mMmZzL2ZpbGUuYyBiL2ZzL2YyZnMvZmlsZS5jCj4gPiA+IGluZGV4IDkzNjZlN2ZjN2MzOS4u
ZDIwY2M1ZjM2ZDRjIDEwMDY0NAo+ID4gPiAtLS0gYS9mcy9mMmZzL2ZpbGUuYwo+ID4gPiArKysg
Yi9mcy9mMmZzL2ZpbGUuYwo+ID4gPiBAQCAtNjEyLDYgKzYxMiwxNSBAQCBzdGF0aWMgaW50IGYy
ZnNfZmlsZV9vcGVuKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0cnVjdCBmaWxlICpmaWxwKQo+ID4g
PiAgICAgICAgIHJldHVybiBmaW5pc2hfcHJlYWxsb2NhdGVfYmxvY2tzKGlub2RlKTsKPiA+ID4g
IH0KPiA+ID4KPiA+ID4gK3N0YXRpYyBib29sIGNoZWNrX2N1cnJfYmxvY2tfaXNfY29uc2VjdXRp
dmUoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLAo+ID4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgYmxvY2tfdCBjdXJyLCBibG9ja190IGVuZCkKPiA+ID4gK3sKPiA+
ID4gKyAgICAgICBpZiAoY3VyciAtIGVuZCA9PSAxIHx8IGN1cnIgPT0gZW5kKQo+ID4gPiArICAg
ICAgICAgICAgICAgcmV0dXJuIHRydWU7Cj4gPiA+ICsgICAgICAgZWxzZQo+ID4gPiArICAgICAg
ICAgICAgICAgcmV0dXJuIGZhbHNlOwo+ID4gPiArfQo+ID4gPiArCj4gPiA+ICB2b2lkIGYyZnNf
dHJ1bmNhdGVfZGF0YV9ibG9ja3NfcmFuZ2Uoc3RydWN0IGRub2RlX29mX2RhdGEgKmRuLCBpbnQg
Y291bnQpCj4gPiA+ICB7Cj4gPiA+ICAgICAgICAgc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpID0g
RjJGU19JX1NCKGRuLT5pbm9kZSk7Cj4gPiA+IEBAIC02MjEsOCArNjMwLDI3IEBAIHZvaWQgZjJm
c190cnVuY2F0ZV9kYXRhX2Jsb2Nrc19yYW5nZShzdHJ1Y3QgZG5vZGVfb2ZfZGF0YSAqZG4sIGlu
dCBjb3VudCkKPiA+ID4gICAgICAgICBpbnQgY2x1c3Rlcl9pbmRleCA9IDAsIHZhbGlkX2Jsb2Nr
cyA9IDA7Cj4gPiA+ICAgICAgICAgaW50IGNsdXN0ZXJfc2l6ZSA9IEYyRlNfSShkbi0+aW5vZGUp
LT5pX2NsdXN0ZXJfc2l6ZTsKPiA+ID4gICAgICAgICBib29sIHJlbGVhc2VkID0gIWF0b21pY19y
ZWFkKCZGMkZTX0koZG4tPmlub2RlKS0+aV9jb21wcl9ibG9ja3MpOwo+ID4gPiArICAgICAgIC8q
Cj4gPiA+ICsgICAgICAgICogVGVtcG9yYXJ5IHJlY29yZCBsb2NhdGlvbi4KPiA+ID4gKyAgICAg
ICAgKiBXaGVuIHRoZSBjdXJyZW50ICBAYmxrYWRkciBhbmQgQGJsa2FkZHJfZW5kIGNhbiBiZSBw
cm9jZXNzZWQKPiA+ID4gKyAgICAgICAgKiB0b2dldGhlciwgdXBkYXRlIHRoZSB2YWx1ZSBvZiBA
YmxrYWRkcl9lbmQuCj4gPiA+ICsgICAgICAgICogV2hlbiBpdCBpcyBkZXRlY3RlZCB0aGF0IGN1
cnJlbnQgQGJsa2FkZHIgaXMgbm90IGNvbnRpbnVlcyB3aXRoCj4gPiA+ICsgICAgICAgICogQGJs
a2FkZHJfZW5kLCBpdCBpcyBuZWNlc3NhcnkgdG8gcHJvY2VzcyBjb250aW51ZXMgYmxvY2tzCj4g
PiA+ICsgICAgICAgICogcmFuZ2UgW2Jsa2FkZHJfc3RhcnQsIGJsa2FkZHJfZW5kXS4KPiA+ID4g
KyAgICAgICAgKi8KPiA+ID4gKyAgICAgICBibG9ja190IGJsa2FkZHJfc3RhcnQsIGJsa2FkZHJf
ZW5kOwo+ID4gPiArICAgICAgIC8qLgo+ID4gPiArICAgICAgICAqIFRvIGF2b2lkIHByb2Nlc3Np
bmcgdmFyaW91cyBpbnZhbGlkIGRhdGEgYmxvY2tzLgo+ID4gPiArICAgICAgICAqIEJlY2F1c2Ug
QGJsa2FkZHJfc3RhcnQgYW5kIEBibGthZGRyX2VuZCBtYXkgYmUgYXNzaWduZWQKPiA+ID4gKyAg
ICAgICAgKiBOVUxMX0FERFIgb3IgaW52YWxpZCBkYXRhIGJsb2NrcywgQGxhc3RfdmFsaWQgaXMg
dXNlZCB0bwo+ID4gPiArICAgICAgICAqIHJlY29yZCB0aGlzIHNpdHVhdGlvbi4KPiA+ID4gKyAg
ICAgICAgKi8KPiA+ID4gKyAgICAgICBib29sIGxhc3RfdmFsaWQgPSBmYWxzZTsKPiA+ID4gKyAg
ICAgICAvKiBQcm9jZXNzIHRoZSBsYXN0IEBibGthZGRyIHNlcGFyYXRlbHk/ICovCj4gPiA+ICsg
ICAgICAgYm9vbCBsYXN0X29uZSA9IHRydWU7Cj4gPiA+Cj4gPiA+ICAgICAgICAgYWRkciA9IGdl
dF9kbm9kZV9hZGRyKGRuLT5pbm9kZSwgZG4tPm5vZGVfcGFnZSkgKyBvZnM7Cj4gPiA+ICsgICAg
ICAgYmxrYWRkcl9zdGFydCA9IGJsa2FkZHJfZW5kID0gbGUzMl90b19jcHUoKmFkZHIpOwo+ID4g
Pgo+ID4gPiAgICAgICAgIC8qIEFzc3VtcHRpb246IHRydW5jYXRpb24gc3RhcnRzIHdpdGggY2x1
c3RlciAqLwo+ID4gPiAgICAgICAgIGZvciAoOyBjb3VudCA+IDA7IGNvdW50LS0sIGFkZHIrKywg
ZG4tPm9mc19pbl9ub2RlKyssIGNsdXN0ZXJfaW5kZXgrKykgewo+ID4gPiBAQCAtNjM4LDI0ICs2
NjYsNjAgQEAgdm9pZCBmMmZzX3RydW5jYXRlX2RhdGFfYmxvY2tzX3JhbmdlKHN0cnVjdCBkbm9k
ZV9vZl9kYXRhICpkbiwgaW50IGNvdW50KQo+ID4gPiAgICAgICAgICAgICAgICAgfQo+ID4gPgo+
ID4gPiAgICAgICAgICAgICAgICAgaWYgKGJsa2FkZHIgPT0gTlVMTF9BRERSKQo+ID4gPiAtICAg
ICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgZ290byBuZXh0Owo+ID4gPgo+ID4gPiAgICAgICAgICAgICAgICAgZjJmc19zZXRfZGF0YV9i
bGthZGRyKGRuLCBOVUxMX0FERFIpOwo+ID4gPgo+ID4gPiAgICAgICAgICAgICAgICAgaWYgKF9f
aXNfdmFsaWRfZGF0YV9ibGthZGRyKGJsa2FkZHIpKSB7Cj4gPiA+ICAgICAgICAgICAgICAgICAg
ICAgICAgIGlmICh0aW1lX3RvX2luamVjdChzYmksIEZBVUxUX0JMS0FERFJfQ09OU0lTVEVOQ0Up
KQo+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOwo+ID4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gbmV4dDsKPiA+ID4gICAgICAgICAg
ICAgICAgICAgICAgICAgaWYgKCFmMmZzX2lzX3ZhbGlkX2Jsa2FkZHJfcmF3KHNiaSwgYmxrYWRk
ciwKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
REFUQV9HRU5FUklDX0VOSEFOQ0UpKQo+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGNvbnRpbnVlOwo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdvdG8g
bmV4dDsKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgaWYgKGNvbXByZXNzZWRfY2x1c3Rl
cikKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2YWxpZF9ibG9ja3MrKzsK
PiA+ID4gICAgICAgICAgICAgICAgIH0KPiA+ID4KPiA+ID4gLSAgICAgICAgICAgICAgIGYyZnNf
aW52YWxpZGF0ZV9ibG9ja3Moc2JpLCBibGthZGRyLCAxKTsKPiA+ID4gKwo+ID4gPiArICAgICAg
ICAgICAgICAgaWYgKGNoZWNrX2N1cnJfYmxvY2tfaXNfY29uc2VjdXRpdmUoc2JpLCBibGthZGRy
LCBibGthZGRyX2VuZCkpIHsKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgLyoKPiA+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICogVGhlIGN1cnJlbnQgYmxvY2sgQGJsa2FkZHIgaXMg
Y29udGludW91cyB3aXRoCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAqIEBibGthZGRy
X2VuZCwgc28gQGJsa2FkZHJfZW5kIGlzIHVwZGF0ZWQuCj4gPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAqIEFuZCB0aGUgZjJmc19pbnZhbGlkYXRlX2Jsb2NrcygpIGlzIHNraXBwZWQKPiA+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICogdW50aWwgQGJsa2FkZHIgdGhhdCBjYW5ub3Qg
YmUgcHJvY2Vzc2VkCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAqIHRvZ2V0aGVyIGlz
IGVuY291bnRlcmVkLgo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgKi8KPiA+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgYmxrYWRkcl9lbmQgPSBibGthZGRyOwo+ID4gPiArICAgICAg
ICAgICAgICAgICAgICAgICBpZiAoY291bnQgPT0gMSkKPiA+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBsYXN0X29uZSA9IGZhbHNlOwo+ID4gPiArICAgICAgICAgICAgICAgICAg
ICAgICBlbHNlCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ290byBza2lw
X2ludmFsaWQ7Cj4gPiA+ICsgICAgICAgICAgICAgICB9Cj4gPiA+ICsKPiA+ID4gKyAgICAgICAg
ICAgICAgIGYyZnNfaW52YWxpZGF0ZV9ibG9ja3Moc2JpLCBibGthZGRyX3N0YXJ0LAo+ID4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYmxrYWRkcl9lbmQgLSBibGth
ZGRyX3N0YXJ0ICsgMSk7Cj4gPiA+ICsgICAgICAgICAgICAgICBibGthZGRyX3N0YXJ0ID0gYmxr
YWRkcl9lbmQgPSBibGthZGRyOwo+ID4gPiArCj4gPiA+ICsgICAgICAgICAgICAgICBpZiAoY291
bnQgPT0gMSAmJiBsYXN0X29uZSkKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgZjJmc19p
bnZhbGlkYXRlX2Jsb2NrcyhzYmksIGJsa2FkZHIsIDEpOwo+ID4gPiArCj4gPiA+ICtza2lwX2lu
dmFsaWQ6Cj4gPiA+ICsgICAgICAgICAgICAgICBsYXN0X3ZhbGlkID0gdHJ1ZTsKPiA+ID4KPiA+
ID4gICAgICAgICAgICAgICAgIGlmICghcmVsZWFzZWQgfHwgYmxrYWRkciAhPSBDT01QUkVTU19B
RERSKQo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICBucl9mcmVlKys7Cj4gPiA+ICsKPiA+
ID4gKyAgICAgICAgICAgICAgIGNvbnRpbnVlOwo+ID4gPiArCj4gPiA+ICtuZXh0Ogo+ID4gPiAr
ICAgICAgICAgICAgICAgLyogSWYgY29uc2VjdXRpdmUgYmxvY2tzIGhhdmUgYmVlbiByZWNvcmRl
ZCwgd2UgbmVlZCB0byBwcm9jZXNzIHRoZW0uICovCj4gPiA+ICsgICAgICAgICAgICAgICBpZiAo
bGFzdF92YWxpZCA9PSB0cnVlKQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICBmMmZzX2lu
dmFsaWRhdGVfYmxvY2tzKHNiaSwgYmxrYWRkcl9zdGFydCwKPiA+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGJsa2FkZHJfZW5kIC0gYmxrYWRkcl9zdGFydCArIDEp
Owo+ID4gPiArCj4gPiA+ICsgICAgICAgICAgICAgICBibGthZGRyX3N0YXJ0ID0gYmxrYWRkcl9l
bmQgPSBsZTMyX3RvX2NwdSgqKGFkZHIgKyAxKSk7Cj4gPiA+ICsgICAgICAgICAgICAgICBsYXN0
X3ZhbGlkID0gZmFsc2U7Cj4gPiA+ICsKPiA+ID4gICAgICAgICB9Cj4gPiA+Cj4gPiA+ICAgICAg
ICAgaWYgKGNvbXByZXNzZWRfY2x1c3RlcikKPiA+ID4gLS0KPiA+ID4gMi4yNS4xCj4gPiA+CgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJm
cy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5u
ZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJm
cy1kZXZlbAo=
