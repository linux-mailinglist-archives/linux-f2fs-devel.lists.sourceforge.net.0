Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D8893FE2C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Jul 2024 21:21:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sYVvv-00012J-J8;
	Mon, 29 Jul 2024 19:21:23 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1sYVvo-000128-LT
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jul 2024 19:21:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=E0Mp0kIle+6lDWqdYj7W3fy8xu6Xs9/BDTN2JJxmcCY=; b=iQ2m/WVqOY1PUrcJ99AcxnzTmY
 0BQbPViETrfMdCQwYShSfu+AUcU6LjoC/4EeUfmfyg5CM7hJFMzKSRJN2SpVb5EiG3cBIlP9UO8UB
 0DfLHE3IYNdxJzeKZIQgzPQ6twSl4JtR+TrpE6JC2eeLl8ESNuXnwszc8DNK07DLTPjw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=E0Mp0kIle+6lDWqdYj7W3fy8xu6Xs9/BDTN2JJxmcCY=; b=VEmM2ntn4K2P17MCyme9ZDQnwI
 iNUCuPOdB3sKuO4xR5shmz+tv2tL1hr8wTtVViZG4PZYY0T4g75Jd/k3jQ+E8TA/gNzl5pm67SJfv
 Ouhx3SC157DB3D8/MiHfALIK1csoMBpcshBexcbd3yDjacA1/praM+7jdHx6IRR3ts3A=;
Received: from mail-ua1-f42.google.com ([209.85.222.42])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sYVvn-0006YT-9E for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jul 2024 19:21:16 +0000
Received: by mail-ua1-f42.google.com with SMTP id
 a1e0cc1a2514c-83120879efcso781147241.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 29 Jul 2024 12:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722280864; x=1722885664; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E0Mp0kIle+6lDWqdYj7W3fy8xu6Xs9/BDTN2JJxmcCY=;
 b=l7pomJ7MyFaf+yFqefzhT2iU8MN25qkH5iTrbOPYZElw6AJ27L+dnjdEsFOdZCILod
 /BYi7ei9JUPQVXfHH8YZzs/pY7PmuUl/rq3G9ZSigl3t4yjQthD2g2329daJGxNr7Ohp
 HwOr8CXgO1JJbKdeCm3rlSPVyR2vCebj+pcZsxqUuow3iIrD7sFQY7IMK+UVj/6BIW/q
 K1yqayxlWwSxokwUqHcQHD+VQ5MCHltjTLd9D0y8El/Gwjcq+k8KhDgq8PbroYIhQNtn
 ZeaYdOzIxtr6CYS0wPdavVFMvkKTgVV0tQBp8FSiPysBM6XHt9D9DTM3NsB8YMDr83Ev
 cD3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722280864; x=1722885664;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E0Mp0kIle+6lDWqdYj7W3fy8xu6Xs9/BDTN2JJxmcCY=;
 b=m15ZMYXiPqz5icbHewycbA+CXAa53kZHOgx4mFQmgryCmdZPo7f7MmSEACmpjI60Oi
 932iwHGmULTk/ORaLx/ODR+vPEcs2zJf68mR7sIM01PN2TYs+oOcXbx9PDUL9UphsNuW
 Th7ViEz+mop8VShwNgEZkeMQtO/KIq1sD8hE++Z5Zq2BCqso4w9n8O/HTtTG1XjPF77e
 FJeeBN/w2vK1YH/enYE1yLYOzoawRBm69Z1lLqux15ohu3qGCIXuA0nw1eiRSvb/jk7I
 uzPE2XPFTR9ryX4Ndy21NDDHLVirfTFnqazVXKHLrbmvF53ggaq7ac9f9KFLG4u40/sA
 aHpA==
X-Gm-Message-State: AOJu0YzTKEEovptxab9UD6HM2jcKZXyPkKjOsjsMgbxU87burXDikSeh
 11BSZ1sXMvFaeCYxIjP+reWX+s09UAFgmGN8bo/4IV3VP1V42f9s/Bq68xhnpVNGhHDJyryFKMN
 LHqxtyVb0Dk0/iUnU9Hcvfeu+O2BW3g==
X-Google-Smtp-Source: AGHT+IEJWMza6wCqohbFoH6YOfrZAsKfQogYtDTzpZy3OKkQuRbSBRG21gKHr6mgrgZJcacEhajutxWaD7ynbIiZwPw=
X-Received: by 2002:a05:6102:c94:b0:492:7bb0:9bc with SMTP id
 ada2fe7eead31-493fa5a16eemr5316570137.30.1722280864225; Mon, 29 Jul 2024
 12:21:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240725183941.655356-1-jaegeuk@kernel.org>
In-Reply-To: <20240725183941.655356-1-jaegeuk@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Mon, 29 Jul 2024 12:20:53 -0700
Message-ID: <CACOAw_xs63xqubrr9_vTR6-NU58LjHdbX1ZL_dJhLbtMnga-gg@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Thu, Jul 25, 2024 at 11:41 AM Jaegeuk Kim wrote: > >
   Signed-off-by: Jaegeuk Kim > --- > fsck/inject.c | 28 +++++++++++++++ > 1
   file changed, 15 insertions(+), 13 deletions(-) > > [...] 
 
 Content analysis details:   (0.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                          [209.85.222.42 listed in sa-trusted.bondedsender.org]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.222.42 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [daeho43[at]gmail.com]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [daeho43[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.222.42 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
X-Headers-End: 1sYVvn-0006YT-9E
Subject: Re: [f2fs-dev] [PATCH] inject.f2fs: fix some build errors
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVGh1LCBKdWwgMjUsIDIwMjQgYXQgMTE6NDHigK9BTSBKYWVnZXVrIEtpbSA8amFlZ2V1a0Br
ZXJuZWwub3JnPiB3cm90ZToKPgo+IFNpZ25lZC1vZmYtYnk6IEphZWdldWsgS2ltIDxqYWVnZXVr
QGtlcm5lbC5vcmc+Cj4gLS0tCj4gIGZzY2svaW5qZWN0LmMgfCAyOCArKysrKysrKysrKysrKyst
LS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAxMyBkZWxl
dGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9mc2NrL2luamVjdC5jIGIvZnNjay9pbmplY3QuYwo+
IGluZGV4IDJhMjFkYWUyOTNmNi4uNGZmZGZkMGYwYjVkIDEwMDY0NAo+IC0tLSBhL2ZzY2svaW5q
ZWN0LmMKPiArKysgYi9mc2NrL2luamVjdC5jCj4gQEAgLTIxMSw2ICsyMTEsOCBAQCBpbnQgaW5q
ZWN0X3BhcnNlX29wdGlvbnMoaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSwgc3RydWN0IGluamVjdF9v
cHRpb24gKm9wdCkKPgo+ICAgICAgICAgd2hpbGUgKChvID0gZ2V0b3B0X2xvbmcoYXJnYywgYXJn
diwgb3B0aW9uX3N0cmluZywKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxvbmdf
b3B0LCBOVUxMKSkgIT0gRU9GKSB7Cj4gKyAgICAgICAgICAgICAgIGxvbmcgbmlkLCBibGs7Cj4g
Kwo+ICAgICAgICAgICAgICAgICBzd2l0Y2ggKG8pIHsKPiAgICAgICAgICAgICAgICAgY2FzZSAx
Ogo+ICAgICAgICAgICAgICAgICAgICAgICAgIGMuZHJ5X3J1biA9IDE7Cj4gQEAgLTI2NSwxMCAr
MjY3LDEwIEBAIGludCBpbmplY3RfcGFyc2Vfb3B0aW9ucyhpbnQgYXJnYywgY2hhciAqYXJndltd
LCBzdHJ1Y3QgaW5qZWN0X29wdGlvbiAqb3B0KQo+ICAgICAgICAgICAgICAgICAgICAgICAgIE1T
RygwLCAiSW5mbzogaW5qZWN0IG5hdCBwYWNrICVzXG4iLCBwYWNrW29wdC0+bmF0XSk7Cj4gICAg
ICAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gICAgICAgICAgICAgICAgIGNhc2UgOToKPiAt
ICAgICAgICAgICAgICAgICAgICAgICBvcHQtPm5pZCA9IHN0cnRvbChvcHRhcmcsICZlbmRwdHIs
IDApOwo+IC0gICAgICAgICAgICAgICAgICAgICAgIGlmIChvcHQtPm5pZCA9PSBMT05HX01BWCB8
fCBvcHQtPm5pZCA9PSBMT05HX01JTiB8fAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAq
ZW5kcHRyICE9ICdcMCcpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgbmlkID0gc3RydG9sKG9w
dGFyZywgJmVuZHB0ciwgMCk7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgaWYgKG5pZCA+PSBV
SU5UX01BWCB8fCAqZW5kcHRyICE9ICdcMCcpCgpEbyB3ZSBzdXBwb3J0IGEgbmVnYXRpdmUgdmFs
dWUgZm9yIG5pZD8KCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVS
QU5HRTsKPiArICAgICAgICAgICAgICAgICAgICAgICBvcHQtPm5pZCA9IG5pZDsKPiAgICAgICAg
ICAgICAgICAgICAgICAgICBNU0coMCwgIkluZm86IGluamVjdCBuaWQgJXUgOiAweCV4XG4iLCBv
cHQtPm5pZCwgb3B0LT5uaWQpOwo+ICAgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+ICAg
ICAgICAgICAgICAgICBjYXNlIDEwOgo+IEBAIC0yODAsMTAgKzI4MiwxMCBAQCBpbnQgaW5qZWN0
X3BhcnNlX29wdGlvbnMoaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSwgc3RydWN0IGluamVjdF9vcHRp
b24gKm9wdCkKPiAgICAgICAgICAgICAgICAgICAgICAgICBNU0coMCwgIkluZm86IGluamVjdCBz
aXQgcGFjayAlc1xuIiwgcGFja1tvcHQtPnNpdF0pOwo+ICAgICAgICAgICAgICAgICAgICAgICAg
IGJyZWFrOwo+ICAgICAgICAgICAgICAgICBjYXNlIDExOgo+IC0gICAgICAgICAgICAgICAgICAg
ICAgIG9wdC0+YmxrID0gc3RydG9sKG9wdGFyZywgJmVuZHB0ciwgMCk7Cj4gLSAgICAgICAgICAg
ICAgICAgICAgICAgaWYgKG9wdC0+YmxrID09IExPTkdfTUFYIHx8IG9wdC0+YmxrID09IExPTkdf
TUlOIHx8Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICplbmRwdHIgIT0gJ1wwJykKPiAr
ICAgICAgICAgICAgICAgICAgICAgICBibGsgPSBzdHJ0b2wob3B0YXJnLCAmZW5kcHRyLCAwKTsK
PiArICAgICAgICAgICAgICAgICAgICAgICBpZiAoYmxrID49IFVJTlRfTUFYIHx8ICplbmRwdHIg
IT0gJ1wwJykKCmRpdHRvCgo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJu
IC1FUkFOR0U7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgb3B0LT5ibGsgPSBibGs7Cj4gICAg
ICAgICAgICAgICAgICAgICAgICAgTVNHKDAsICJJbmZvOiBpbmplY3QgYmxrYWRkciAldSA6IDB4
JXhcbiIsIG9wdC0+YmxrLCBvcHQtPmJsayk7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgYnJl
YWs7Cj4gICAgICAgICAgICAgICAgIGNhc2UgMTI6Cj4gQEAgLTQzMiw3ICs0MzQsNyBAQCBzdGF0
aWMgaW50IGluamVjdF9jcChzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIHN0cnVjdCBpbmplY3Rf
b3B0aW9uICpvcHQpCj4gICAgICAgICB9Cj4KPiAgICAgICAgIGlmICghc3RyY21wKG9wdC0+bWIs
ICJjaGVja3BvaW50X3ZlciIpKSB7Cj4gLSAgICAgICAgICAgICAgIE1TRygwLCAiSW5mbzogaW5q
ZWN0IGNoZWNrcG9pbnRfdmVyIG9mIGNwICVkOiAweCVsbHggLT4gMHglbHhcbiIsCj4gKyAgICAg
ICAgICAgICAgIE1TRygwLCAiSW5mbzogaW5qZWN0IGNoZWNrcG9pbnRfdmVyIG9mIGNwICVkOiAw
eCVsbHggLT4gMHglIlBSSXg2NCJcbiIsCj4gICAgICAgICAgICAgICAgICAgICBvcHQtPmNwLCBn
ZXRfY3AoY2hlY2twb2ludF92ZXIpLCAodTY0KW9wdC0+dmFsKTsKPiAgICAgICAgICAgICAgICAg
c2V0X2NwKGNoZWNrcG9pbnRfdmVyLCAodTY0KW9wdC0+dmFsKTsKPiAgICAgICAgIH0gZWxzZSBp
ZiAoIXN0cmNtcChvcHQtPm1iLCAiY2twdF9mbGFncyIpKSB7Cj4gQEAgLTUxMCw3ICs1MTIsNyBA
QCBzdGF0aWMgaW50IGluamVjdF9uYXQoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBzdHJ1Y3Qg
aW5qZWN0X29wdGlvbiAqb3B0KQo+ICAgICAgICAgaW50IHJldDsKPgo+ICAgICAgICAgaWYgKCFJ
U19WQUxJRF9OSUQoc2JpLCBvcHQtPm5pZCkpIHsKPiAtICAgICAgICAgICAgICAgRVJSX01TRygi
SW52YWxpZCBuaWQgJXUgcmFuZ2UgWyV1OiVsdV1cbiIsIG9wdC0+bmlkLCAwLAo+ICsgICAgICAg
ICAgICAgICBFUlJfTVNHKCJJbnZhbGlkIG5pZCAldSByYW5nZSBbJXU6JSJQUkl1NjQiXVxuIiwg
b3B0LT5uaWQsIDAsCj4gICAgICAgICAgICAgICAgICAgICAgICAgTkFUX0VOVFJZX1BFUl9CTE9D
SyAqCj4gICAgICAgICAgICAgICAgICAgICAgICAgKChnZXRfc2Ioc2VnbWVudF9jb3VudF9uYXQp
IDw8IDEpIDw8Cj4gICAgICAgICAgICAgICAgICAgICAgICAgIHNiaS0+bG9nX2Jsb2Nrc19wZXJf
c2VnKSk7Cj4gQEAgLTYyNyw3ICs2MjksNyBAQCBzdGF0aWMgaW50IGluamVjdF9zaXQoc3RydWN0
IGYyZnNfc2JfaW5mbyAqc2JpLCBzdHJ1Y3QgaW5qZWN0X29wdGlvbiAqb3B0KQo+ICAgICAgICAg
ICAgICAgICBzaXQtPnZhbGlkX21hcFtvcHQtPmlkeF0gPSAodTgpb3B0LT52YWw7Cj4gICAgICAg
ICB9IGVsc2UgaWYgKCFzdHJjbXAob3B0LT5tYiwgIm10aW1lIikpIHsKPiAgICAgICAgICAgICAg
ICAgTVNHKDAsICJJbmZvOiBpbmplY3Qgc2l0IGVudHJ5IG10aW1lIG9mIGJsb2NrIDB4JXggIgo+
IC0gICAgICAgICAgICAgICAgICAgImluIHBhY2sgJWQ6ICVsdSAtPiAlbHVcbiIsIG9wdC0+Ymxr
LCBvcHQtPnNpdCwKPiArICAgICAgICAgICAgICAgICAgICJpbiBwYWNrICVkOiAlIlBSSXU2NCIg
LT4gJSJQUkl1NjQiXG4iLCBvcHQtPmJsaywgb3B0LT5zaXQsCj4gICAgICAgICAgICAgICAgICAg
ICBsZTY0X3RvX2NwdShzaXQtPm10aW1lKSwgKHU2NClvcHQtPnZhbCk7Cj4gICAgICAgICAgICAg
ICAgIHNpdC0+bXRpbWUgPSBjcHVfdG9fbGU2NCgodTY0KW9wdC0+dmFsKTsKPiAgICAgICAgIH0g
ZWxzZSB7Cj4gQEAgLTc1MiwxMSArNzU0LDExIEBAIHN0YXRpYyBpbnQgaW5qZWN0X2lub2RlKHN0
cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgc3RydWN0IGYyZnNfbm9kZSAqbm9kZSwKPiAgICAgICAg
ICAgICAgICAgICAgIG9wdC0+bmlkLCBsZTMyX3RvX2NwdShpbm9kZS0+aV9saW5rcyksICh1MzIp
b3B0LT52YWwpOwo+ICAgICAgICAgICAgICAgICBpbm9kZS0+aV9saW5rcyA9IGNwdV90b19sZTMy
KCh1MzIpb3B0LT52YWwpOwo+ICAgICAgICAgfSBlbHNlIGlmICghc3RyY21wKG9wdC0+bWIsICJp
X3NpemUiKSkgewo+IC0gICAgICAgICAgICAgICBNU0coMCwgIkluZm86IGluamVjdCBpbm9kZSBp
X3NpemUgb2YgbmlkICV1OiAlbHUgLT4gJWx1XG4iLAo+ICsgICAgICAgICAgICAgICBNU0coMCwg
IkluZm86IGluamVjdCBpbm9kZSBpX3NpemUgb2YgbmlkICV1OiAlIlBSSXU2NCIgLT4gJSJQUkl1
NjQiXG4iLAo+ICAgICAgICAgICAgICAgICAgICAgb3B0LT5uaWQsIGxlNjRfdG9fY3B1KGlub2Rl
LT5pX3NpemUpLCAodTY0KW9wdC0+dmFsKTsKPiAgICAgICAgICAgICAgICAgaW5vZGUtPmlfc2l6
ZSA9IGNwdV90b19sZTY0KCh1NjQpb3B0LT52YWwpOwo+ICAgICAgICAgfSBlbHNlIGlmICghc3Ry
Y21wKG9wdC0+bWIsICJpX2Jsb2NrcyIpKSB7Cj4gLSAgICAgICAgICAgICAgIE1TRygwLCAiSW5m
bzogaW5qZWN0IGlub2RlIGlfYmxvY2tzIG9mIG5pZCAldTogJWx1IC0+ICVsdVxuIiwKPiArICAg
ICAgICAgICAgICAgTVNHKDAsICJJbmZvOiBpbmplY3QgaW5vZGUgaV9ibG9ja3Mgb2YgbmlkICV1
OiAlIlBSSXU2NCIgLT4gJSJQUkl1NjQiXG4iLAo+ICAgICAgICAgICAgICAgICAgICAgb3B0LT5u
aWQsIGxlNjRfdG9fY3B1KGlub2RlLT5pX2Jsb2NrcyksICh1NjQpb3B0LT52YWwpOwo+ICAgICAg
ICAgICAgICAgICBpbm9kZS0+aV9ibG9ja3MgPSBjcHVfdG9fbGU2NCgodTY0KW9wdC0+dmFsKTsK
PiAgICAgICAgIH0gZWxzZSBpZiAoIXN0cmNtcChvcHQtPm1iLCAiaV9leHRyYV9pc2l6ZSIpKSB7
Cj4gQEAgLTgzNSw3ICs4MzcsNyBAQCBzdGF0aWMgaW50IGluamVjdF9ub2RlKHN0cnVjdCBmMmZz
X3NiX2luZm8gKnNiaSwgc3RydWN0IGluamVjdF9vcHRpb24gKm9wdCkKPiAgICAgICAgIGludCBy
ZXQ7Cj4KPiAgICAgICAgIGlmICghSVNfVkFMSURfTklEKHNiaSwgb3B0LT5uaWQpKSB7Cj4gLSAg
ICAgICAgICAgICAgIEVSUl9NU0coIkludmFsaWQgbmlkICV1IHJhbmdlIFsldTolbHVdXG4iLCBv
cHQtPm5pZCwgMCwKPiArICAgICAgICAgICAgICAgRVJSX01TRygiSW52YWxpZCBuaWQgJXUgcmFu
Z2UgWyV1OiUiUFJJdTY0Il1cbiIsIG9wdC0+bmlkLCAwLAo+ICAgICAgICAgICAgICAgICAgICAg
ICAgIE5BVF9FTlRSWV9QRVJfQkxPQ0sgKgo+ICAgICAgICAgICAgICAgICAgICAgICAgICgoZ2V0
X3NiKHNlZ21lbnRfY291bnRfbmF0KSA8PCAxKSA8PAo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICBzYmktPmxvZ19ibG9ja3NfcGVyX3NlZykpOwo+IEBAIC04NjUsNyArODY3LDcgQEAgc3RhdGlj
IGludCBpbmplY3Rfbm9kZShzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIHN0cnVjdCBpbmplY3Rf
b3B0aW9uICpvcHQpCj4gICAgICAgICAgICAgICAgIGZvb3Rlci0+ZmxhZyA9IGNwdV90b19sZTMy
KCh1MzIpb3B0LT52YWwpOwo+ICAgICAgICAgfSBlbHNlIGlmICghc3RyY21wKG9wdC0+bWIsICJj
cF92ZXIiKSkgewo+ICAgICAgICAgICAgICAgICBNU0coMCwgIkluZm86IGluamVjdCBub2RlIGZv
b3RlciBjcF92ZXIgb2YgbmlkICV1OiAiCj4gLSAgICAgICAgICAgICAgICAgICAiMHglbHggLT4g
MHglbHhcbiIsIG9wdC0+bmlkLCBsZTY0X3RvX2NwdShmb290ZXItPmNwX3ZlciksCj4gKyAgICAg
ICAgICAgICAgICAgICAiMHglIlBSSXg2NCIgLT4gMHglIlBSSXg2NCJcbiIsIG9wdC0+bmlkLCBs
ZTY0X3RvX2NwdShmb290ZXItPmNwX3ZlciksCj4gICAgICAgICAgICAgICAgICAgICAodTY0KW9w
dC0+dmFsKTsKPiAgICAgICAgICAgICAgICAgZm9vdGVyLT5jcF92ZXIgPSBjcHVfdG9fbGU2NCgo
dTY0KW9wdC0+dmFsKTsKPiAgICAgICAgIH0gZWxzZSBpZiAoIXN0cmNtcChvcHQtPm1iLCAibmV4
dF9ibGthZGRyIikpIHsKPiAtLQo+IDIuNDYuMC5yYzEuMjMyLmc5NzUyZjllMTIzLWdvb2cKPgo+
Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IExp
bnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Cj4gTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQKPiBodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5m
by9saW51eC1mMmZzLWRldmVsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZl
bEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlz
dHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
